# Ubuntu Squash Repository - Architecture Guide

## Overview

This repository is part of the [netboot.xyz](https://netboot.xyz) build pipeline ecosystem. It uses a multi-branch architecture where each branch represents a different Ubuntu variant, version, and architecture. The repository automatically builds and publishes netboot artifacts (kernels, initrds, and squashfs filesystems) extracted from upstream Ubuntu ISO images.

## Repository Structure

### Branch Architecture

The repository uses a **branch-per-variant** pattern. Each branch is independent and contains:

1. **Configuration Files**
   - `settings.sh` - Defines the upstream ISO URL and files to extract
   - `version.sh` - Script to check the latest upstream version
   - `endpoints.template` - Endpoint configuration for netboot.xyz integration
   - `README.md` - Basic repository information

2. **GitHub Workflows** (in `.github/workflows/`)
   - Each branch contains its own workflow file
   - Workflow filename matches the branch name (e.g., `ubuntu-netboot-25.10-amd64.yml`)
   - Workflows are stored in the branch they build, not on master

### Branch Naming Convention

Branches follow consistent naming patterns:

- **Netboot variants**: `ubuntu-netboot-{version}-{arch}`
  - Examples: `ubuntu-netboot-25.10-amd64`, `ubuntu-netboot-25.10-arm64`

- **Desktop variants**: `ubuntu-{flavor}-{version}`
  - Examples: `ubuntu-default-24.04`, `kubuntu-22.04`, `ubuntu-mate-22.04`

- **Specialized variants**: Various Ubuntu flavors like `ubuntu-budgie`, `ubuntu-kylin`, etc.

## How It Works

### 1. Version Checking

Each branch has a `version.sh` script that queries the upstream Ubuntu repository to detect new releases:

```bash
#!/bin/bash
set -e
VERSION=$(curl -sL <upstream-url> | grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
```

**Example URLs by variant:**
- **Netboot (amd64)**: `http://releases.ubuntu.com/questing/` (or codename)
- **Netboot (arm64)**: `https://cdimage.ubuntu.com/releases/25.10/release/`

### 2. Configuration Files

#### `settings.sh`

Defines what to extract from the ISO:

```bash
URL="http://releases.ubuntu.com/questing/ubuntu-REPLACE_VERSION-live-server-amd64.iso"
TYPE=file
CONTENTS="\
casper/vmlinuz|vmlinuz
casper/initrd|initrd"
EXTRACT_INITRD="false"
INITRD_NAME="initrd"
INITRD_TYPE="lz4"
```

**Key fields:**
- `URL` - Upstream ISO location (REPLACE_VERSION is substituted at runtime)
- `TYPE` - Extraction type (`file` for direct extraction)
- `CONTENTS` - Files to extract from ISO (format: `source|destination`)
- `EXTRACT_INITRD` - Whether to decompress initrd
- `INITRD_TYPE` - Compression type (e.g., `lz4`, `gzip`)

#### `endpoints.template`

Defines the netboot.xyz endpoint configuration:

```yaml
endpoints:
  ubuntu-netboot-25.10-amd64:
    path: /ubuntu-squash/releases/download/REPLACE_RELEASE_NAME/
    files:
    - initrd
    - vmlinuz
    os: ubuntu
    version: 'REPLACE_VERSION'
    codename: questing
    flavor: netboot
    kernel: ubuntu-netboot-25.10-amd64
    arch: amd64
```

This configuration is consumed by netboot.xyz to provide boot options to users.

### 3. GitHub Actions Workflow

Each variant has a workflow that:

1. **Triggers on:**
   - Push to the specific branch (excluding workflow changes)
   - Weekly schedule (cron: `0 4 * * 4` - Thursdays at 4 AM UTC)
   - Manual workflow dispatch

2. **Workflow steps:**
   - Checkout the specific branch
   - Run `version.sh` to get the latest upstream version
   - Create a tag: `{VERSION}-{git-sha-8-chars}`
   - Compare tag with existing releases
   - If new version detected:
     - Download build.sh from [build-pipelines](https://github.com/netbootxyz/build-pipelines)
     - Extract files from ISO using `settings.sh` configuration
     - Create GitHub release with extracted artifacts
     - Generate and commit endpoint configuration
     - Send Discord notifications (success/failure)

### 4. Release Artifacts

Built artifacts are published as GitHub releases with tags like:

- `25.10.1-d6d70d2` (version-gitsha)

Each release contains the extracted files (kernels, initrds, squashfs, etc.) ready for netboot.xyz consumption.

## Ubuntu Version Codenames Reference

| Version | Codename | Type |
|---------|----------|------|
| 25.10   | questing | Development |
| 25.04   | plucky   | LTS (planned) |
| 24.10   | oracular | Standard |
| 24.04   | noble    | LTS |
| 23.10   | mantic   | Standard |
| 23.04   | lunar    | Standard |
| 22.04   | jammy    | LTS |
| 20.04   | focal    | LTS |

## Adding a New Ubuntu Version

To add support for a new Ubuntu version (e.g., Ubuntu 25.10 "questing"):

### 1. Create New Branches

```bash
# For amd64
git checkout -b ubuntu-netboot-25.10-amd64 ubuntu-netboot-25.04-amd64

# For arm64
git checkout -b ubuntu-netboot-25.10-arm64 ubuntu-netboot-25.04-arm64
```

### 2. Update Configuration on Each Branch

**For amd64 branch:**

Edit `settings.sh`:
```bash
URL="http://releases.ubuntu.com/questing/ubuntu-REPLACE_VERSION-live-server-amd64.iso"
```

Edit `version.sh`:
```bash
VERSION=$(curl -sL http://releases.ubuntu.com/questing/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
```

Edit `endpoints.template`:
```yaml
endpoints:
  ubuntu-netboot-25.10-amd64:
    # ... update version, codename, kernel name
    version: 'REPLACE_VERSION'
    codename: questing
    kernel: ubuntu-netboot-25.10-amd64
```

**For arm64 branch:** Similar changes with arm64-specific URLs:
```bash
URL="https://cdimage.ubuntu.com/releases/25.10/release/ubuntu-REPLACE_VERSION-live-server-arm64.iso"
VERSION=$(curl -sL https://cdimage.ubuntu.com/releases/25.10/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
```

### 3. Create Workflow Files (in each branch)

**On the ubuntu-netboot-25.10-amd64 branch:**

Create `.github/workflows/ubuntu-netboot-25.10-amd64.yml` based on the previous version's workflow, updating:
- Workflow name to `ubuntu-netboot-25.10-amd64`
- Branch references to `ubuntu-netboot-25.10-amd64`
- Environment variable `BRANCH` to `ubuntu-netboot-25.10-amd64`

**On the ubuntu-netboot-25.10-arm64 branch:**

Create `.github/workflows/ubuntu-netboot-25.10-arm64.yml` with the same pattern for arm64

### 4. Commit and Push All Changes

**For each branch:**
```bash
# On ubuntu-netboot-25.10-amd64 branch
git add settings.sh version.sh endpoints.template .github/workflows/ubuntu-netboot-25.10-amd64.yml
git commit -m "Add Ubuntu 25.10 (questing) amd64 netboot support"
git push origin ubuntu-netboot-25.10-amd64

# On ubuntu-netboot-25.10-arm64 branch
git add settings.sh version.sh endpoints.template .github/workflows/ubuntu-netboot-25.10-arm64.yml
git commit -m "Add Ubuntu 25.10 (questing) arm64 netboot support"
git push origin ubuntu-netboot-25.10-arm64
```

The workflows will automatically start checking for new releases on the scheduled runs.

## Integration with build-pipelines

This repository works in conjunction with [netbootxyz/build-pipelines](https://github.com/netbootxyz/build-pipelines), which provides:

- `build.sh` - Main build orchestration script
- ISO download and extraction logic
- Release comparison and tagging
- Endpoint generation
- Discord notification integration

## Upstream Sources

- **Ubuntu releases**: https://releases.ubuntu.com/
- **Ubuntu CD images**: https://cdimage.ubuntu.com/
- **Ubuntu kernel archives**: https://mirrors.edge.kernel.org/ubuntu/dists/

## Environment Variables & Secrets

Workflows use the following GitHub secrets:

- `GITHUB_TOKEN` - Automatically provided by GitHub Actions
- `CI_TOKEN` - Custom token for CI operations
- `DISCORD_HOOK_URL` - Webhook for Discord notifications

## Maintenance Notes

- Workflows run weekly to automatically detect new point releases
- Each branch is independent; changes to one variant don't affect others
- Each branch contains its own workflow file (not stored on master)
- The master branch primarily holds documentation (claude.md, README.md)
- Releases are immutable; each version gets its own tagged release
- Failed builds trigger Discord notifications for quick response
