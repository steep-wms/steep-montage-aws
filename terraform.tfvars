#### SET THE FOLLOWING VARIABLES!

# local aws profile
aws_profile           = ""

# keypair to use for EC2 Instances
keypair               = ""


#### OPTIONAL VARIABLES

# private key to use for ssh auth
keyfile               = "~/.ssh/id_rsa"

# instance types
steep_instance_type   = "t2.large"
mongodb_instance_type = "t2.large"
gateway_instance_type = "t2.large"

# instance counts
steep_node_count      = 4  # must be a multiple of 'glusterfs_replicas'
glusterfs_replicas    = 2
mongodb_node_count    = 1

# disk sizes
steep_disk_size       = 10
glusterfs_disk_size   = 100  # total size will be steep_node_count * glusterfs_disk_size / glusterfs_replicas
mongodb_disk_size     = 10
gateway_disk_size     = 10
