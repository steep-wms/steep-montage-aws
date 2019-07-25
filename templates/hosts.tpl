[all:vars]
ansible_user=ubuntu
ansible_python_interpreter=/usr/bin/python3
docker_username=${docker_username}
docker_password=${docker_password}

[proxy_nodes]
${ proxy_node }

[proxy_nodes:vars]
nginx_config_file=/etc/nginx/nginx.conf

[jobmanager_nodes]
${ jobmanager_nodes }

[jobmanager_nodes:vars]
proxy_node_public_ip=${ bastion_node }
