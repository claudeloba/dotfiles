# My system setup

This will use ansible to setup software and dotfiles for a new system.
This playbook will setup your system with the following:

- Git
- Zsh
- Curl
- Nvim & NvChad
- Node & NPM & FNM
- JetBrains Nerd Font
- Dotfiles using Stow

## Folder structure

my_ansible_project/inventory/hosts

my_ansible_project/setup.yaml

## Pre-required setup before running playbook:

1. apt update
2. apt install -y python3 python3-pip python3-venv vim
3. mkdir ~/ansible-env
4. python3 -m venv ~/ansible-env
5. source ~/ansible-env/bin/activate
6. pip install ansible

## Running the playbook:

1. Setup folder structure as mentioned above
2. run `ansible-playbook -i inventory/hosts setup.yaml`

## After running the playbook:

1. Switch to Zsh shell
2. run `nvim` to setup NvChad
