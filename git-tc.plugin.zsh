function git-tc() {
  TESTFILE=./$(git rev-parse --show-cdup).git-tc.txt
  BUFFER=$(cat $TESTFILE | peco --query "$LBUFFER")
  print -z "git commit -m \"$(echo $BUFFER)\""
}
