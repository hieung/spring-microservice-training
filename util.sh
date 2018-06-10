#!/bin/bash

declare CONTEXT=$(pwd)
declare COMMAND=$1


build_all ()
{
    mvn -DskipTests=true clean install
}	# ----------  end of function build_all  ----------

clean_all() {
    docker rm -fv $(docker ps -a | awk ' /'springms'/ {print $1} ')
    docker rmi $(docker images | awk ' /'spring-ms'/ {print $3} ')
}

build ()
{
    mvn -DskipTests=true clean install -f $1
}	# ----------  end of function build  ----------

clean ()
{
    docker rm -fv $(docker ps -a | awk ' /'springms_$1'/ {print $1} ')
    docker rmi $(docker images | awk ' /'spring-ms.$1'/ {print $3} ')
}	# ----------  end of function clean  ----------

