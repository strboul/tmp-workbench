# system

Ansible system configuration.

## Testing

### Vagrant playground

Bring up & reboot & destroy the VM
```
vagrant up
vagrant reload
vagrant destroy -f
```

SSH into VM
```
vagrant ssh

# or manually, from private network
ssh -i .vagrant/machines/default/virtualbox/private_key vagrant@192.168.56.2
```

Run provisions
```
ansible-playbook -v -i vagrant.inventory work.yml

# or single tasks(?)
ansible-playbook -v -i vagrant.inventory roles/base/tasks/yay.yml
# ...
```

+ Use `-vvv` for extra printing to debug Ansible.

### Troubleshooting

+ If can't connect to vagrant, check IP interfaces with `ip a` and find out
  what the range is for `vboxnet0`.

+ If you get unreachable error in ssh, try removing corresponding entries from
  `.ssh/known_hosts`.
