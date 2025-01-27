# README

A GitHub Action for building packages for Ubuntu Touch based on https://github.com/addnab/docker-run-action

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
      uses: tuxecure/clickable@v1
      with:
        image: clickable/ci-20.04-${{ matrix.arch }}
        run: clickable build
    - name: Upload .click package
      uses: actions/upload-artifact@v3.1.1
      with:
        path: build/*/app/*.click
    - name: Publish to Open Store
        if: startsWith( github.ref, 'refs/tags/')
        env:
          OPENSTORE_KEY: ${{ secrets.OPENSTORE_KEY }}
        run: clickable publish "* $(git log -1 --pretty=%B | head -1)" --apikey ${OPENSTORE_KEY}
```
