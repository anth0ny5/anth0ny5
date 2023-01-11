#!/bin/bash

ansible-playbook ~/ansible/playbooks/reboot.yml -i ~/ansible/inventory/reboot --ask-become-pass