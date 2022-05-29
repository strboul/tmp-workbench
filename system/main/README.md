# main

[Ansible](https://www.ansible.com/) system configuration.

Be sure that you run the changes from the path:

```sh
cd system/main
```

## 1. Setup Ansible

Install Ansible and AUR module.

```sh
sudo pacman -S ansible
ansible-galaxy collection install kewlfft.aur
```

## 2. Run the playbooks

Run a playbook profile (with certain tags):

```sh
./profiles/work.sh -i localhost.inventory --ask-become-pass
```

:arrow_right: See more Ansible options at [ansible.md](ansible.md)

Recommended to reboot the system after the installation is completed.

## 3. Encrypted content

Some content is encrypted with `ansible-vault` passphrase, which is encrypted with gpg.

<details>

#### Setup gpg passphrase

Generate a new vault passphrase and encrypt with `gpg`:

```sh
pwgen -n 71 -1 | gpg --armor --recipient <GPG-ID> -e -o vault_passphrase.gpg
```

Create the executable to pass to `--vault-password-file`:

```sh
echo '''#!/bin/sh
gpg --batch --use-agent --decrypt vault_passphrase.gpg''' > vault_pass.sh
chmod +x vault_pass.sh
```

`vault_password_file` is already added to `ansible.cfg` but it can also be
called with an argument.

#### Encrypt files

Encrypt existing files. Due to `vault_password_file` set in `ansible.cfg`,
vault password will not be prompted.

```sh
ansible-vault encrypt <file>
```

View/edit encrypted files with `view` and `edit`, respectively.

Resources:

- [Encrypting content with Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)

- [Encrypting the Ansible Vault passphrase using GPG](https://disjoint.ca/til/2016/12/14/encrypting-the-ansible-vault-passphrase-using-gpg/)

</details>
