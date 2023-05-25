FROM tomcat:8.5.37-jre8
copy target/*war /usr/local/tomcat/webapps
