if [ $# -le 0 ]
then
  echo "Usage: NAME TARGET"
  exit 1
fi

sudo docker run -w /aosp/$1 -v $(pwd)/ccache:/ccache -v $(pwd)/android:/aosp android-build:latest /usr/local/bin/aosp $2
