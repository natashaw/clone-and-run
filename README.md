# clone-and-run
A repo of dotfiles and scripts I use to sync my setup across different machines

<!-- TODO: rewrite this whole README -->
<!-- add a note that an error like the following is not an issue after running ./settings/.macos -->
<!-- 2023-09-15 23:43:33.102 systemsetup[49868:1604188] ### Error:-99 File:/AppleInternal/Library/BuildRoots/97f6331a-ba75-11ed-a4bc-863efbbaf80d/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379
2023-09-15 23:43:33.223 systemsetup[49877:1604235] ### Error:-99 File:/AppleInternal/Library/BuildRoots/97f6331a-ba75-11ed-a4bc-863efbbaf80d/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379
2023-09-15 23:43:33.392 systemsetup[49887:1604348] ### Error:-99 File:/AppleInternal/Library/BuildRoots/97f6331a-ba75-11ed-a4bc-863efbbaf80d/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379 -->

## Getting Started 🚧
1. Clone this repo along with the [dotbot](https://github.com/anishathalye/dotbot/tree/master) submodule
2. Adjust CONFIG path in `install` and run the dotbot install script
3. Install dependencies and relogin/restart

```bash
./dependencies/macos.sh
brew bundle
```

## Raycast Scripts 🚧
Make sure to populate `GH_TOKEN` in `scripts/access-github.sh` before adding directory to Raycast

## Manual Configuration Checklist 🚧
- [ ] Configure Keyboard Input Sources
- [ ] (for M1 Chip) Go to `/Applications` and right-click to `Get Info` of iTerm.app and Terminal.app. Enable `Open using Rosetta`.
- [ ] Set individual apps to launch at login