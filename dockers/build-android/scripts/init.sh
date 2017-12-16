if [ "$#" -ne 3 ]
then
  echo "Usage: NAME URL BRANCH"
  exit 1
fi

sudo docker run -v $(pwd)/ccache:/ccache -v $(pwd)/android:/aosp android-build:latest mkdir $1
sudo docker run -w /aosp/$1 -v $(pwd)/ccache:/ccache -v $(pwd)/android:/aosp android-build:latest repo init -u $2 -b $3 --depth=1
