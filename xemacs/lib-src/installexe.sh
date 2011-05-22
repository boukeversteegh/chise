#!bash

install_prog=$1
shift

tstr=""

while [[ $# -gt 0 ]]
do
  if [[ -f $1.exe ]]
  then
    if [[ "$2" == *.exe ]]
    then
      tstr="$tstr$1 $2"
    else
      tstr="$tstr$1.exe $2.exe"
    fi
    shift 2
  else
    tstr="$tstr$1 "
  fi
  shift
done
echo "$install_prog $tstr"
eval "$install_prog $tstr"
exit

