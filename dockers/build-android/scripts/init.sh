if [ "$#" -ne 3 ]
then
  echo "Usage: URL BRANCH NAME"
  exit 1
fi

../run.sh "mkdir $3; cd $3; repo init -u $1 -b $2 --depth=1"
