# Dotfiles

Personal dotfiles for macOS.

***Warning***: Parts of the installation process will overwrite existing configuration files. You should fork this repository, review the code, and make additions or omissions before proceeding. _Use at your own risk!_

## Installing

1. If your Mac does not have Git installed, first install the Xcode Command Line Tools.

```shell
xcode-select --install
```

2. Clone the bare Git repository.

```shell
git clone --bare https://github.com/ryantoddgarza/dotfiles.git $HOME/.dotfiles
```

### Path 1: Run scripts manually

3. Checkout and setup the Git repository.

***Warning***: This command will overwrite existing files with matching filenames. Backup your files before proceeding.

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout --force
dotf submodule update --init --recursive
dotf config status.showUntrackedFiles no
```

4. Review the following scripts and make additions or omissions.

- `~/.macos/install-software`
- `~/.macos/set-app-preferences`
- `~/.macos/set-macos-defaults`

5. Run the provided scripts.

```shell
cd ~/.macos
./install-software
./set-app-preferences
./set-macos-defaults
```

### Path 2: Run the `bootstrap` script

The [`bootstrap` script](.macos/bootstrap) provides a single command to execute the manual installation steps above.

***Warning***: This command will always checkout _forcibly_; local changes will be lost. Backup you files before proceeding.

3. Run the bootstrap script.

```shell
~/.macos/bootstrap
```

For additional usage options, run:

```shell
~/.macos/bootstrap --help
