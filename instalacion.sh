DIR=/opt/liferay-portal-6.1.2-ce-ga3
TOM=$DIR/tomcat-7.0.40
unzip liferay-portal-tomcat-6.1.2-ce-ga3-20130816114619181.zip -d /opt
echo "portal.security.manager.strategy=none" > $DIR/portal-ext.properties
cp ejb.jar javax.el-3.0.1-b09.jar $TOM/lib/
mv $TOM/lib/ext/postgresql.jar $TOM/lib/ext/postgresql-jar 
cp postgresql-42.2.5.jar $TOM/lib/ext
cp context.xml $TOM/conf
chown -R tomcat7: $DIR
