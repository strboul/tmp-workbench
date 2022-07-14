# main

[Ansible](https://www.ansible.com/) system configuration.

Be sure that you run the changes from the path:

```sh
cd system/main
```

## 1. Setup Ansible

Install Ansible and Ansible Galaxy requirements.

```sh
sudo pacman -S ansible
ansible-galaxy install -r ansible-galaxy.yml
```

## 2. Run the playbooks

Run whole profile:

```sh
./profiles/work.sh -i localhost.inventory
```

Run particular tags:

```sh
ansible-playbook -v -i localhost.inventory -e "arg_hostname=hostname" --extra-vars="@config.yml" --tags="<tag1>,<tag2>" --ask-become-pass main.yml
```

Optional arguments:

- `--vault-password-file=vault_pass.sh`: to access to the encrypted stuff.

Helper commands to list the playbooks:

```sh
ansible-playbook main.yml --list-tasks
ansible-playbook main.yml --list-tags
```

## 3. Encrypted content

Some content is encrypted with `ansible-vault` passphrase, which is encrypted
with `gpg`.

#### Encrypted files

```sh
ansible-vault --vault-password-file=vault_pass.sh encrypt <file>
```

View/decrypt the encrypted files with `view`, `decrypt` respectively.

Edit the encrypted file with your favorite editor:

```sh
EDITOR=nvim ansible-vault --vault-password-file=vault_pass.sh edit <file>
```

#### Resources

- [Encrypting content with Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)

- [Encrypting the Ansible Vault passphrase using GPG](https://disjoint.ca/til/2016/12/14/encrypting-the-ansible-vault-passphrase-using-gpg/)
