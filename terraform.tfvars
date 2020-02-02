aws_profile           = ""  # local aws profile
keypair               = ""  # keypair to use for EC2 Instances
keyfile               = "~/.ssh/id_rsa"  # private key to use for ssh auth

steep_instance_type   = "t2.large"
mongodb_instance_type = "t2.large"
gateway_instance_type = "t2.large"

steep_node_count      = 4  # must be a multiple of 'glusterfs_replicas'
glusterfs_replicas    = 2
mongodb_node_count    = 1

steep_disk_size       = 10
glusterfs_disk_size   = 100  # total size will be steep_node_count * glusterfs_disk_size / glusterfs_replicas
mongodb_disk_size     = 10
gateway_disk_size     = 10
