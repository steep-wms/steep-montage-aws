[all:vars]
ansible_user=ubuntu
ansible_python_interpreter=/usr/bin/python3
docker_username=${docker_username}
docker_password=${docker_password}

[proxy_nodes]
${ proxy_node }

[proxy_nodes:vars]
nginx_config_file=/etc/nginx/nginx.conf

[mongodb_nodes]
${ mongodb_nodes }

[mongodb_master]
${ mongodb_master }

[mongodb_nodes:vars]
mongodb_data_volume=${ mongodb_data_volume }
mongodb_data_dir=${ mongodb_data_dir }

[jobmanager_nodes]
${ jobmanager_nodes }

[jobmanager_nodes:vars]
proxy_node_public_ip=${ bastion_node }

[glusterfs_nodes]
${ jobmanager_nodes }

[glusterfs_nodes:vars]
glusterfs_brick_volume=${ glusterfs_brick_volume }
glusterfs_brick_dir=${ glusterfs_brick_dir }
glusterfs_replicas=${ glusterfs_replicas }
