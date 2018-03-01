package 'java-1.8.0-openjdk'

remote_file '/opt/apache-tomcat-8.5.28.tar.gz' do
    source 'http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.28/bin/apache-tomcat-8.5.28.tar.gz'
    action :create
end 

execute 'Extract tomcat' do 
    command 'cd /opt && tar xf apache-tomcat-8.5.28.tar.gz'
end 

FILES=Dir["/opt/apache-tomcat-8.5.28/webapps/*"]
FILES.each do |lfile|
    file "#{lfile}" do 
        action :delete
    end
end