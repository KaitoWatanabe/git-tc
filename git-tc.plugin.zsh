function gitcom() {
  TESTFILE=./$(git rev-parse --show-cdup).git-tc.txt
  BUFFER=$(cat $TESTFILE | eval tail -r | peco --query "$LBUFFER")
  print -z "git commit -m \"$(echo $BUFFER)\""
}
