#
# Cookbook Name:: logrotate
# Recipe:: default
#

remote_file "/etc/logrotate.d/nginx" do
  source "nginx.logrotate"
  owner "root"
  group "root"
  mode 0644
  backup false  
  action :create
end

remote_file "/etc/logrotate.d/application-logs" do
  source "application.logrotate"
  owner "root"
  group "root"
  mode 0644
  backup false
  action :create
end
