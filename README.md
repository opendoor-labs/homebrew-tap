# Opendoor Homebrew Tap

A custom set of [Homebrew](https://brew.sh) formulae for installing Opendoor dev components.

## Prerequisites

* [Homebrew](https://brew.sh)

## Recommended

* [homebrew-services](https://github.com/Homebrew/homebrew-services)

## Usage

```sh
$ brew tap opendoor-labs/tap
$ brew install gothumb

# if you've installed homebrew-services:
$ brew services start gothumb
```

## Development

To test changes put up a branch/PR then `cd` to the local version of this repo installed by `homebrew tap 'opendoor-labs/tap'`:

```shell
> cd /usr/local/Homebrew/Library/Taps/opendoor-labs/homebrew-tap
```

This directory is a `git` repository corresponding to this repo so `git pull` then checkout your branch:

```shell
> git pull
> git checkout <your-branch-here>
```

Then run whatever `brew` commands you want with any changes to formula applied.
