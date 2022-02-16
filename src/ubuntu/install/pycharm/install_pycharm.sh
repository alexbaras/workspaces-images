# Install PyCharm
cd /opt
PYCHARM_VERSION="pycharm-community-2021.1.1"
curl -L -o $PYCHARM_VERSION.tar.gz "https://download.jetbrains.com/python/$PYCHARM_VERSION.tar.gz"
tar xf $PYCHARM_VERSION.tar.gz
rm -rf $PYCHARM_VERSION.tar.gz
mv /opt/$PYCHARM_VERSION /opt/pycharm
