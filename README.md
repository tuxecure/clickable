# README

A GitHub Action for building packages for ubuntu touch

## Usage

Customize following example workflow and save as `.github/workflows/clickable.yml` on your source repository.

## Examples

```yaml
name: Clickable Build

on:
  push:

jobs:
  build:
    strategy:
      matrix:
        arch: [amd64, arm64, armhf]
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          submodules: 'true'
      - name: Install clickable
        run: |
          python3 -m pip install clickable-ut
      - name: Build
        run: |
          clickable build --arch ${{ matrix.arch }}
      - name: Upload Artifacts
        uses: actions/upload-artifact@v3
        with:
          name: app.domainname_${{ matrix.arch }}
          path: build/*/app/*.click
          if-no-files-found: error
```
