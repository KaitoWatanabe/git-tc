function git-tc() {
  if [ "$1" != "" ]; then    
    case "$1" in
      "init" )  git-tc-init ;;
      "-b" ) git-tc-default "branch: $(git_current_branch)" ;;
      * ) git-tc-option "$1" ;;
    esac
  else
    git-tc-default ''
  fi
}

function git-tc-init() {
  CONFIGFILE=./$(git rev-parse --show-cdup).git-tc.yml
  if [ ! -f $CONFIGFILE ]; then
    cp ~/.oh-my-zsh/custom/plugins/git-tc/.git-tc.yml.example $CONFIGFILE
    echo "\`.git-tc.yml\` file created."
  else
    echo "error: \`.git-tc.yml\` file exists."
  fi
}

function git-tc-default() {
  CONFIGFILE=./$(git rev-parse --show-cdup).git-tc.yml
  if [ -f $CONFIGFILE ]; then
    BUFFER=$(cat $CONFIGFILE | shyaml get-value list | peco --query "$LBUFFER")
    print -z "git commit -m \"$1 $(echo $BUFFER | sed -e 's/#[^#]*#//g')\" "
  else
    echo "error: .git-tc.text not found. please command \`git-tc init\`"
  fi
}

function git-tc-option() {
  CONFIGFILE=./$(git rev-parse --show-cdup).git-tc.yml
  NOCOMMAND=true
    cat $CONFIGFILE | shyaml get-values-0 option | 
    while IFS='' read -r -d '' key && IFS='' read -r -d '' value; do
      if [ "-$key" = "$1" ]; then
        git-tc-default "$value"
        NOCOMMAND=false
      fi
    done
    if [ "$NOCOMMAND" = true ]; then
      echo "error: $1 is not found"
    fi
}