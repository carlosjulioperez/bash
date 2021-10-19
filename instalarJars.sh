# https://stackoverflow.com/questions/44828958/how-do-format-and-traverse-an-array-that-contains-arrays-and-each-array-contain/44831174#44831174
JARS_DIR="/home/cjperez/Descargas"

# groupId artifactId version

arr01=( 'org.eclipse.m2e'          'lifecycle-mapping'       '1.0.0')
arr02=( 'org.codehaus.mojo'        'dbunit-maven-plugin'     '1.0-beta-3')
arr03=( 'org.codehaus.mojo'        'hibernate3-maven-plugin' '2.2')
arr04=( 'org.apache.maven.plugins' 'maven-release-plugin'    '2.3.2')
arr05=( 'org.apache.maven.plugins' 'maven-dependency-plugin' '2.8')
arr06=( 'org.apache.maven.plugins' 'maven-assembly-plugin'   '2.2-beta-5')
arr07=( 'org.codehaus.plexus'      'plexus-utils'            '1.1')
arr08=( 'org.apache.ant'           'ant'                     '1.8.1')

arr1=( arr01 arr02 arr03 arr04 arr05 arr06 arr07 arr08 )
arr=(arr1)

declare -n elmv1 elmv2

for elmv1 in "${arr[@]}"; do
    for elmv2 in "${elmv1[@]}"; do
        #for elm in "${elmv2[@]}"; do
        #    echo "<$elm>"
        #done

        # test cj
        ARCHIVO=$JARS_DIR/${elmv2[1]}-${elmv2[2]}.jar
        echo "Instalando $ARCHIVO ..."
    
        mvn install:install-file \
          -Dfile=$ARCHIVO \
          -DgroupId=${elmv2[0]} \
          -DartifactId=${elmv2[1]} -Dversion=${elmv2[2]} -Dpackaging=jar
    done
done

#mvn install:install-file \
#  -Dfile=/home/cjperez/Descargas/lifecycle-mapping-1.0.0.jar \
#  -DgroupId=org.eclipse.m2e \
#  -DartifactId=lifecycle-mapping -Dversion=1.0.0 -Dpackaging=jar

