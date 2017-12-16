if [ "$#" -ne 1 ]
then
  echo "Usage: NAME"
  exit 1
fi

../run.sh "cd $1; repo sync -j8"
