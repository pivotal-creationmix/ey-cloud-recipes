remote_file "/etc/monit.d/nginx.monitrc" do
  owner "root"
  group "root"
  mode 0644
  source "nginx.monitrc"
  backup false
  action :create
end

execute "restart nginx" do
  command "sudo monit reload"
end