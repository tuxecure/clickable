# README

A GitHub Action for building packages for ubuntu touch

## Usage

Customize following example workflow and save as `.github/workflows/clickable.yml` on your source repository.

## Examples

```yaml
jobs:
  ubuntu-touch:
    strategy:
      fail-fast: false
      matrix:
         arch: [armhf, arm64, amd64]
    runs-on: ubuntu-latest
    steps:
    - name: Checkout 
      uses: actions/checkout@v2 # Required to mount the Github Workspace to a volume 
    - name: build package
      uses: tuxecure/clickable@v0.3
      with:
        image: clickable/ci-16.04-${{ matrix.arch }}
        run: |
              cd /tmp/clickable_base; \
              clickable build
    - name: Upload .click package
          uses: actions/upload-artifact@v3.1.1
          with:
            path: |
              build/*/app/*.click
```
