# unagents/homebrew-tap

Homebrew tap for unagents apps.

```sh
brew tap unagents/tap
brew install --cask bantou
```

Update with `brew update && brew upgrade --cask bantou`.

`Casks/bantou.rb` is updated through the GitHub API by `desktop/scripts/publish-cask.sh`
in the [bantou](https://github.com/unagents/bantou) repository on each release.
