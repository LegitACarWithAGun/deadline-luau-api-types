## Type definition files for Deadline's insitux luau api
intended to be used with [JohnnyMorganz/luau-lsp](https://github.com/JohnnyMorganz/luau-lsp) in vscode ([vscode extension](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp))

### Usage:
- (todo) git subtree this project into yours
- copy the contents of .vscode into your project
- reload the window and you should get autocomplete for deadline globals, and everything else yould expect from a language server

### TODO:
- [ ] `luau-lsp.types.definitionFiles` doesnt seem to take globs
- [ ] seemingly no way to for client and server definitions to only apply seperatlely
  - [ ] client type definitions
- [ ] not all globals are here yet
- [ ] comments in definition files dont work yet (upstream)
  - [ ] write better comments for everything