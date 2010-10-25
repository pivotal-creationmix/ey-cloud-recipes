node[:applications].each do |app, data|
  template "/data/nginx/servers/#{app}-redirect-www.conf" do
    owner node[:users].first[:username]
    group node[:users].first[:gid]
    mode 0644
    source "redirect-www.conf.erb"
    variables(
      :server_name => data[:vhosts].first[:name],
      :http_bind_port => data[:http_bind_port]
    )
    action :create
  end
end