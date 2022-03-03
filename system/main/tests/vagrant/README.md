## vagrant

Vagrant is very helpful for testing things quickly, especially for the command
line configuration. For OS and GUI setup, it's better to provision a
separate VM, i.e. QEMU/KVM or VirtualBox.

Bring up & reboot & destroy machines:

```sh
vagrant up
vagrant reload
vagrant destroy -f
```

SSH into machines:

```sh
vagrant ssh

# get ssh config
vagrant ssh-config

# or manually, from private network
ssh -i ~/.vagrant.d/insecure_private_key vagrant@192.168.56.2
```

Run provisions:

```sh
ansible-playbook -v -i tests/vagrant/vagrant.inventory playbook.yml
```

### Troubleshooting

+ Use `-vvv` to increase verbosity level.

+ If can't connect to vagrant, check IP interfaces with `ip a` and find out
  what the range is for `vboxnet0`.

+ If you get unreachable error in ssh, try removing corresponding entries from
  `.ssh/known_hosts` (it's now disabled the SSH host key checking so this is
  unlikely).
