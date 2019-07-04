[all:vars]
ansible_user=ubuntu
#ansible_ssh_private_key_file=/var/ans/master_key
ansible_python_interpreter=/usr/bin/python3
docker_username=${docker_username}
docker_password=${docker_password}

[proxy_nodes]
${ proxy_node }

[proxy_nodes:vars]
nginx_config_file=/etc/nginx/nginx.conf

[cassandra:children]
cassandra_nodes

[cassandra:vars]
cassandra_config_file=/etc/cassandra/cassandra.yaml
cassandra_cluster_name=tankstore
number_of_seeds=${number_of_seeds}

[cassandra_nodes]
${ nodes }

[tank_nodes]
${ nodes }
