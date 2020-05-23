<%-- 
   Copyright 2012 Manning Publications Co.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--%>
<%	
  String ctxAdr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Apache Chemistry OpenCMIS InMemory Repository</title>
</head>
<body>
<h1>Apache Chemistry OpenCMIS InMemory Repository is up and running!</h1>

<table>
  <tr><td>CMIS Web Services Binding:</td><td><code><%= ctxAdr %>/services/RepositoryService?wsdl</code></td></tr>
  <tr><td>CMIS AtomPub Binding:</td><td><code><%= ctxAdr %>/atom</code></td></tr>
  <tr><td>CMIS Browser Binding Binding:</td><td><code><%= ctxAdr %>/browser</code></td></tr>
</table>

</body>