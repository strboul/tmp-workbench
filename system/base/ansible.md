## Ansible notes

### Tasks

List tasks

```sh
ansible-playbook playbooks/main.yml --list-tasks
```

### Tags

Rule: When creating a tag, use the name of the playbook first and put two
underscores and then put the tag names, i.e. `<playbook>__<name1>__<name2>`.

List tags

```sh
ansible-playbook playbooks/main.yml --list-tags
```

Run only tags

```sh
ansible-playbook -v -i <inventory> playbooks/main.yml --tags "zsh,tmux"
```
