Host *
	SendEnv LANG LC_*

Host ${ network }
  IdentityFile ${ ssh_key }
  ProxyCommand ssh ${ ssh_username }@${ bastion_node } -W %h:%p

Host ${ bastion_node }
  IdentityFile ${ ssh_key }
  User ${ ssh_username }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m