remote_file "/etc/nginx/servers/CreationMix_Demo_basic_auth.conf" do
  owner "deploy"
  group "deploy"
  mode 0644
  source "nginx_http_basic_auth.conf"
  backup false
  action :create
end

remote_file "/etc/nginx/servers/CreationMix_Demo.users" do
  owner "deploy"
  group "deploy"
  mode 0644
  source "demo_user"
  backup false
  action :create
end

