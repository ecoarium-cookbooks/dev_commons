servers = data_bag("servers").collect{ |s| data_bag_item("servers", s) }

host_file_path = '/etc/hosts'

if node.platform == 'windows'
  host_file_path = 'C:\Windows\System32\drivers\etc\hosts'
end

template host_file_path do
  source "hosts.erb"

  if node.platform != 'windows'
    owner 'root'
    group 'root'
    mode "0644"
  end

  variables( servers: servers )
end
