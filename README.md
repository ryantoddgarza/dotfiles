# Dotfiles

## Installing on macOS

**Warning**: The installation process will overwrite existing configuration files. You should fork this repository, review the code, and make additions or omissions before proceeding. _Use at your own risk!_

1. If your mac does not have Git installed, first install the Xcode Command Line Tools.

```sh
xcode-select --install
```

2. Clone the bare Git repository.

```sh
git clone --bare https://github.com/ryantoddgarza/dotfiles.git $HOME/.dotfiles
```

3. Checkout the Git repository.

```sh
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout --force
```

4. Run the bootstrap script.

```sh
bash bootstrap.sh
```
