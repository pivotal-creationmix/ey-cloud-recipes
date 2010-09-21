#
# Cookbook Name:: logrotate
# Recipe:: default
#

remote_file "/etc/logrotate.d/nginx" do
  source "nginx.logrotate"
  owner "root"
  group "root"
  mode "0655"
  backup 0
end

remote_file "/etc/logrotate.d/application-logs" do
  source "application-logs.logrotate"
  owner "root"
  group "root"
  mode 0755
  backup false
  action :create
end

cron "logrotate -f /etc/logrotate.d/nginx" do
  minute  '0'
  command "logrotate -f /etc/logrotate.d/nginx"
  user "root"
end