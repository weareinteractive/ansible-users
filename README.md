# Ansible Users Role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-users.svg)](https://travis-ci.org/weareinteractive/ansible-users)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.supervisor-blue.svg)](https://galaxy.ansible.com/list#/roles/1383)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-users.svg)](https://github.com/weareinteractive/ansible-users)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-users.svg)](https://github.com/weareinteractive/ansible-users)

> `users` is an [Ansible](http://www.ansible.com) role which:
>
> * creates users
> * adds/creates private ssh key
> * configures authorized keys

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.users
```

Using `requirements.yml`:

```
- src: franklinkim.users
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-users.git franklinkim.users
```

## Dependencies

* Ansible 1.9

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# array of users to add
users: []
# users home directory
users_home: /home
# default user primary group for users
users_group:
# default user secondary groups
users_groups: []
# default user home directory permissions
users_home_mode: "0755"
```

A user might look like this:

```
# user's name
username: foobar    (required)
# user's full name
name: Foo Bar
# primary group
group: staff
# list of secondary groups
groups: ["adm", "www-data"]
# home directory permissions
home_mode: "0750"
# create home directory
home_create: yes
# create as system user
system: no
# list of authorized keys
authorized_keys:
  - "xxx"
  - "xxx"
# copy a key
ssh_key: "xxx\nxxx\n"
# generate a key
ssh_key_generate: no
# generated key password
ssh_key_password: ""
# generated key bit number
ssh_key_bits: 2048
# generated/copied key type
# (will also define the key file name as id_{{ ssh_key_type }})
ssh_key_type: rsa
```

## Example playbook

```
- host: all
  sudo: yes
  roles:
    - franklinkim.users
  vars:
    users:
      # regular user
      - username: foobar1
        name: Foo bar
      # user with generated key
      - username: foobar2
        ssh_key_generate: yes
      # user with copies key
      - username: foobar3
        ssh_key: "xxx"
    users_group: staff
    users_groups:
      - adm
      - www-data
```

*Note: Take a look at the `test.yml` for more examples*

## Testing

```
$ git clone https://github.com/weareinteractive/ansible-users.git
$ cd ansible-users
$ vagrant up
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.

