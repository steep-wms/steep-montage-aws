[all:vars]
ansible_user=ubuntu
#ansible_ssh_private_key_file=/var/ans/master_key
ansible_python_interpreter=/usr/bin/python3
docker_username=${docker_username}
docker_password=${docker_password}
setupElk=False
teardownElk=False
pruneData=True

[proxy_nodes]
${ proxy_node }

[proxy_nodes:vars]
nginx_config_file=/etc/nginx/nginx.conf

[jobmanager_nodes]
${ jobmanager_nodes }

[jobmanager_nodes:vars]
navigator_config_file=/opt/navigator/config.json
proxy_node_public_ip=${ bastion_node }
