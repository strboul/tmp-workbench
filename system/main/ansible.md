## Ansible notes

### Tasks

List tasks

```sh
ansible-playbook main.yml --list-tasks
```

### Tags

Rule: When creating a tag, use the name of the playbook first and put two
underscores and then put the tag names, i.e. `<playbook>__<name1>__<name2>`.

List tags

```sh
ansible-playbook main.yml --list-tags
```

Run only tags

```sh
ansible-playbook -v -i <inventory> main.yml --tags="packages__zsh,packages__tmux"
```

### Other arguments

| argument            | description                                              |
|:--------------------|:---------------------------------------------------------|
| `--ask-become-pass` | will ask you to enter the sudo password in the beginning |
| `--step`            | one-step-at-a-time: confirm each task before running     |
