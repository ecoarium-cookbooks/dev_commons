
# raise "here::: #{node[:dev_commons][:share_name]}"
unless node[:dev_commons][:user_name].nil?
  group node[:dev_commons][:group_name]

  user node[:dev_commons][:user_name] do
    comment "#{node[:dev_commons][:user_name]} User"
    home    node[:dev_commons][:home_dir]
    shell   "/bin/bash"
    gid     node[:dev_commons][:user_name]
    system true
  end

  execute 'remount runtime-share' do
    command "mount -t vboxsf -o uid=$(id -u #{node[:dev_commons][:user_name]}),gid=$(getent group #{node[:dev_commons][:group_name]} | cut -d: -f3) #{node[:dev_commons][:share_name]} #{node[:dev_commons][:home_dir]}"
    action :run
  end
end
