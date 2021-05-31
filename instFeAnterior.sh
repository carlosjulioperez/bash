SOURCE=/home/carper/feinst/feAnterior
TOMCAT_HOME=/opt/tomcat-latest
CIA=hpm

DIR=$TOMCAT_HOME/webapps

DIR1=$DIR/cjfews
DIR2=$DIR/fe

rm -rf $DIR1 $DIR2

mkdir $DIR1
mkdir $DIR2

# Descomprimir en la carpeta destino
# https://stackoverflow.com/questions/15830952/extracting-jar-to-specified-directory
cd $DIR1
jar -xvf $SOURCE/cjfews.war

cd $DIR2
jar -xvf $SOURCE/$CIA/fe.war

chown -hR tomcat8: $DIR1 $DIR2

ls -alrt $DIR
tail -5 $DIR/fe/WEB-INF/classes/shiro.ini

cd $SOURCE
