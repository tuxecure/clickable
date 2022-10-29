# README

A GitHub Action for building packages

## Usage

Customize following example workflow and save as `.github/workflows/wbuilder.yml` on your source repository.


```yaml
name: arm64

on: [push]

jobs:
  wbuilder:
    runs-on: ubuntu-22.04
    steps:
    - uses: actions/checkout@v3
    - uses: tuxecure/clickable
    - name: arm64
      run: clickable build
```
