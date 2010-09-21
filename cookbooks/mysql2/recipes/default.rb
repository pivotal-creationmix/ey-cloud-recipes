node[:applications].each do |app_name, data|
  user = node[:users].first

  template "/data/#{app_name}/shared/config/database.yml" do
    source "database.yml.erb"
    owner user[:username]
    group user[:username]
    mode 0744
    variables({
      :username => user[:username],
      :app_name => app_name,
      :db_pass => user[:password],
      :node => node
    })
  end

end