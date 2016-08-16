# Thanks-To:
#   https://www.uninformativ.de/blog/postings/2014-06-26/0/POSTING-de.html

mkcd()
{
  mkdir -p -- "$@" && cd -- "$@"
}

mth()
{
  (( $# == 0 )) && exit 1

  TH=~/tmp/$(date +%F)

  mkdir -p -- "$TH"
  mv -vi -- "$@" "$TH"
}

alias tt='mkcd /tmp/tmp'
alias th='mkcd ~/tmp/"$(date +%F)"'
