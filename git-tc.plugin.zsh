function git-tc() {
  GITTCFILE=./$(git rev-parse --show-cdup).git-tc.txt
  if [ "$1" != "" ]; then
    if [ $1 = init ]; then
      if [ ! -f $GITTCFILE ]; then
        touch $GITTCFILE
        echo -e "test" >> $GITTCFILE
      else
        echo "file exists"
      fi
    else
      echo "$1 is not found"
    fi
  else
    BUFFER=$(cat $GITTCFILE | peco --query "$LBUFFER")
    print -z "git commit -m \"$(echo $BUFFER | sed -e 's/#[^#]*#//g')\""
  fi
}
