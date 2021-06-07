
## Build Docker Container for Ansible Playbook
```shell 
$ docker build -t local/ansible:ovirt .

$ docker run --rm -v "${PWD}:/code" -v "${HOME}/.ssh:/root/.ssh" -w /code -it local/ansible:ovirt bash
```

## Create VirtualMachine on Ovirt Using Ansible Playbook
```shell  
$ ansible-playbook ovirt-playbook/playbook.yaml

$ ansible bastion -i ovirt-playbook/hosts -m ping
bastion-01 | SUCCESS => {  
    "changed": false,
    "ping": "pong"
}
```

## Create Multiple VirtualMachine on Ovirt Using Ansible Playbook / Create and Attache Disk Volume
```shell
$ ansible-playbook -i ovirt-playbook/hosts ovirt-playbook/multiple.yaml --extra-vars "vm_state=running disk_state=absent"

$ ansible all -i playbook/hosts --list-hosts
  hosts (5):
    bastion-01
    web-01
    web-02
    was-01
    was-02

$ ansible all -i ovirt-playbook/hosts -m ping
bastion-01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
web-01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
was-02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
was-01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
web-02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```