## Installing

Requires `git` and GNU `stow`

Clone into the `$HOME` directory

```bash
git clone https://github.com/lukeramljak/dotfiles.git ~
```

Run `stow` to symlink everything or select specific directories

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh # Just the zsh config
```
