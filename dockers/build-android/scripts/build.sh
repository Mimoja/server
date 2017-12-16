if [ "$#" -ne 1 ]
then
  echo "Usage: TARGET NAME"
  exit 1
fi

../run.sh "cd $2; source build/envsetup.sh ; lunch $1 ; make -j16"
