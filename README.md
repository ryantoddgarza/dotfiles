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

3. Checkout and setup the Git repository.

***Warning***: This command will overwrite existing files with matching filenames. Backup your files before proceeding.

```shell
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout --force
dotf submodule update --init --recursive
dotf config status.showUntrackedFiles no
```

4. Review the following scripts and make additions or omissions.

- `~/.macos/install-software`
- `~/.macos/set-macos-defaults`

5. Run the provided scripts.

```shell
cd ~/.macos
./install-software
./set-macos-defaults
```

## Troubleshooting

### Could not write domain

If you get the error `Could not write domain <domain>; exiting` after running [set-macos-defaults](.macos/set-macos-defaults), you may need to grant your terminal app Full Disk Access: _System Settings > Privacy & Security > Full Disk Access_
