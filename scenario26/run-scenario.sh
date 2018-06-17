#!/bin/bash

# Copyright (c) 2017, WSO2 Inc. (http://wso2.com) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

prgdir=$(dirname "$0")
scriptPath=$(cd "$prgdir"; pwd)

sh $scriptPath/jmeter/26-pre-scenario-steps.sh

$JMETER_HOME/bin/jmeter.sh -n -t $scriptPath/jmeter/01-Scenario-26-UserManagement.jmx -p $scriptPath/resources/user.properties	
sleep 30

$JMETER_HOME/bin/jmeter.sh -n -t $scriptPath/jmeter/02-Scenario-26-UserManagementSCIM.jmx -p $scriptPath/resources/user.properties	
sleep 10

sh $scriptPath/jmeter/26-post-scenario-steps.sh
