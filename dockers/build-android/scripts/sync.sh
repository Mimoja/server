if [ "$#" -ne 1 ]
then
  echo "Usage: NAME"
  exit 1
fi

sudo docker run -w /aosp/$1 -v $(pwd)/ccache:/ccache -v $(pwd)/android:/aosp android-build:latest repo sync -j8
