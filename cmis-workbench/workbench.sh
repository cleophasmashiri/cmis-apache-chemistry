#!/bin/sh

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Version: 0.9.0-beta-1 / Revision: 1437542 / Build: 2013-01-23T11:30:40-0500

if [ -z "$JAVA_HOME" ]; then
  j=$(which java 2>/dev/null)
  if [ -z "$j" ]; then
 	echo "Unable to locate Java!"
    exit 1
  else
    JAVA="$j"
  fi
else
  JAVA="$JAVA_HOME/bin/java"
fi


SCRIPT_DIR=$(dirname "$0")
cd "$SCRIPT_DIR/lib"

WCP="."
for i in *.jar; do
  WCP="$i:${WCP}"
done


JAVA_OPTS="-Dcmis.workbench.url=http://localhost:8081/inmemory/atom -Dcmis.workbench.user=test -Dcmis.workbench.binding=atompub -Djava.net.useSystemProxies=true"

if [ -n "$http_proxy" ]; then
  HTTP_PROXY_HOST=$(echo $http_proxy | sed 's/http:\/\/\(.*\):.*/\1/')
  HTTP_PROXY_PORT=$(echo $http_proxy | sed 's/http:\/\/.*:\(.*\)/\1/')
  JAVA_OPTS="-Dcmis.workbench.url=http://localhost:8081/inmemory/atom -Dcmis.workbench.user=test -Dcmis.workbench.binding=atompub $JAVA_OPTS -Dhttp.proxyHost=$HTTP_PROXY_HOST -Dhttp.proxyPort=$HTTP_PROXY_PORT"
fi

if [ -n "$https_proxy" ]; then
  HTTPS_PROXY_HOST=$(echo $https_proxy | sed 's/http:\/\/\(.*\):.*/\1/')
  HTTPS_PROXY_PORT=$(echo $https_proxy | sed 's/http:\/\/.*:\(.*\)/\1/')
  JAVA_OPTS="-Dcmis.workbench.url=http://localhost:8081/inmemory/atom -Dcmis.workbench.user=test -Dcmis.workbench.binding=atompub $JAVA_OPTS -Dhttps.proxyHost=$HTTPS_PROXY_HOST -Dhttps.proxyPort=$HTTPS_PROXY_PORT"
fi


exec $JAVA $JAVA_OPTS -classpath $WCP org.apache.chemistry.opencmis.workbench.Workbench &
