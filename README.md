# clone-and-run
A repo of dotfiles and scripts I use to sync my setup across different machines

## Getting Started
1. Clone this repo along with the [dotbot](https://github.com/anishathalye/dotbot/tree/master) submodule
2. Adjust CONFIG path in `install` and run the dotbot install script
3. Install dependencies and relogin/restart

```bash
./dependencies/macos.sh
brew bundle
```

## Raycast Scripts
Make sure to populate `GH_TOKEN` in `scripts/access-github.sh` before adding directory to Raycast

## Manual Configuration Checklist
- [ ] Configure Keyboard Input Sources
- [ ] (for M1 Chip) Go to `/Applications` and right-click to `Get Info` of iTerm.app and Terminal.app. Enable `Open using Rosetta`.
- [ ] Set individual apps to launch at login