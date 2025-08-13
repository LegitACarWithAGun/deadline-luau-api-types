## Type definition files for Deadline's luau modding api
intended to be used with [JohnnyMorganz/luau-lsp](https://github.com/JohnnyMorganz/luau-lsp) in vscode ([vscode extension](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp))

### Usage:
- copy this project into yours
  - reccomended to use `git submodule` for this, just do `git submodule add https://github.com/LegitACarWithAGun/deadline-luau-api-types.git deadline-types`
- copy the `.vscode` folder into your project root
  - remember to change the paths for each item in ***Your*** `.vscode/settings.json -> luau-lsp.types.definitionFiles`
- reload the window and you should get autocomplete for deadline globals, and everything else yould expect from a language server

### Updating:
- if using git submodules, just move into the submodule folder (run `cd deadline-types`) and run `git pull`
- if theres any updates to settings.json, you have to manually port those over to your project (sorry) 

### TODO:
- [ ] `luau-lsp.types.definitionFiles` doesnt seem to take globs
- [ ] seemingly no way to for client and server definitions to only apply seperatlely
  - [ ] client type definitions
- [ ] not all globals are here yet
- [ ] comments in definition files dont work yet (upstream)
  - [ ] write better comments for everything
- [ ] disabled globals need to be manually ported over to each project, annoying!