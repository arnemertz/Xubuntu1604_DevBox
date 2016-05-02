apt-get update && apt-get -y upgrade && apt-get -y autoremove

sudo apt-get -y install git

sudo apt-get -y install clang-3.7
PWD=$(pwd)
cd /usr/bin && for C in $(ls clang*); do L=${C%-3.7}; T=$(readlink $C); sudo ln -s $T $L; done && cd $PWD

sudo apt-get -y install cmake

CLION_VERSION=2016.1.1
sudo wget -q http://download.jetbrains.com/cpp/CLion-${CLION_VERSION}.tar.gz
sudo tar xfz CLion-${CLION_VERSION}.tar.gz -C /opt
