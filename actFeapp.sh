SOURCE="/home/carper/feinst"
DIR="/opt/tomcat-latest/webapps/feapp"

rm -rf $DIR
mkdir -p $DIR
cd $DIR
jar -xvf $SOURCE/feapp.war
chown -hR tomcat8: $DIR

cd $SOURCE
