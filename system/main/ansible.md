## Ansible notes

### Tasks

List tasks

```sh
ansible-playbook playbook.yml --list-tasks
```

### Tags

Rule: When creating a tag, use the name of the playbook first and put two
underscores and then put the tag names, i.e. `<playbook>__<name1>__<name2>`.

List tags

```sh
ansible-playbook playbook.yml --list-tags
```

Run only tags

```sh
ansible-playbook -v -i <inventory> playbook.yml --tags "zsh,tmux"
```
