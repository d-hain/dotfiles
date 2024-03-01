# My dotfiles

Here all my currently used dotfiles layed out as if they were in my `$HOME`.

# Cloning

Clone this repo into a subdirectory. For example `~/dotfiles/`.

If you also want to have [my nvim config](https://github.com/d-hain/init.lua) use this command:
```shell
git clone --recurse-submodules https://github.com/d-hain/dotfiles
```

Then use [GNU Stow](https://www.gnu.org/software/stow/) to symlink all dotfiles:
```shell
stow .
```
