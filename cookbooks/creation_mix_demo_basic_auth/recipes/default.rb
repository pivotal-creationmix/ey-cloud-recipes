execute "setup users file with demo user" do
  command "htpasswd -bc /etc/nginx/servers/CreationMix_Demo.users demo warehouse"
end

remote_file "/etc/nginx/servers/CreationMix_Demo.conf" do
  owner "deploy"
  group "deploy"
  mode 0644
  source "demo_nginx_http_basic_auth.conf"
  backup false
  action :create
end

remote_file "/etc/nginx/common/proxy-headers.conf" do
  owner "deploy"
  group "deploy"
  mode 0644
  source "proxy-headers.conf"
  backup false
  action :create
end

execute "restart nginx" do
  command "sudo /etc/init.d/nginx restart"
end