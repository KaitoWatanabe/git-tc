function git-tc() {
  GITTCFILE=./$(git rev-parse --show-cdup).git-tc.txt
  if [ "$1" != "" ]; then
    case "$1" in
      "init" )  git-tc-init ;;
      "-b" ) git-tc-default "branch: $(git_current_branch)" ;;
      "-p" ) git-tc-default "[WIP]" ;;
      * ) echo "error: $1 is not found" ;;
    esac
  else
    git-tc-default ''
  fi
}

function git-tc-init() {
  GITTCFILE=./$(git rev-parse --show-cdup).git-tc.txt
  if [ ! -f $GITTCFILE ]; then
    cp ~/.oh-my-zsh/custom/plugins/git-tc/.git-tc.txt.example $GITTCFILE
    echo "\`.git-tc.txt\` file created."
  else
    echo "error: \`.git-tc.txt\` file exists."
  fi
}

function git-tc-default() {
  GITTCFILE=./$(git rev-parse --show-cdup).git-tc.txt
  if [ -f $GITTCFILE ]; then
    BUFFER=$(cat $GITTCFILE | peco --query "$LBUFFER")
    print -z "git commit -m \"$1 $(echo $BUFFER | sed -e 's/#[^#]*#//g')\" "
  else
    echo "error: .git-tc.text not found. please command \`git-tc init\`"
  fi
}
