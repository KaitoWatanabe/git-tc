# git-tc

![image](https://github.com/KaitoWatanabe/git-tc/blob/master/git-tc.gif)

oh-my-zsh plugin for managing branches

If you use this, manage your team commit message with git-tc template. 


## Installation

`git-tc` is built to work with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/), so you’ll need that installed first.
and require [peco](https://github.com/peco/peco). enter `brew install peco`, require [shyaml](https://github.com/0k/shyaml). enter `pip install shyaml`

1. `$ cd ~/.oh-my-zsh/custom/plugins` (you may have to create the folder)
2. `$ git clone https://github.com/KaitoWatanabe/git-tc.git`
3. In your .zshrc, add `git-tc` to your oh-my-zsh plugins:
   
  ```bash 
  plugins(rails git git-tc)
  ```

  # Use
  1. `git-tc init` in your root projct. You will get `.git-tc.yml` file.
  2. change your `.git-tc.yml`. between @ and @ comment is ignored only show in peco.
  3. enter `git-tc`

  ## option
  1. `git-tc -b` attach `your current branch` to commit message.
  2. chagne your `.git-tc.yml`. You can add option.
