# Ansible Users Role

[![Build Status](https://travis-ci.org/weareinteractive/ansible-users.png?branch=master)](https://travis-ci.org/weareinteractive/ansible-users)
[![Stories in Ready](https://badge.waffle.io/weareinteractive/ansible-users.svg?label=ready&title=Ready)](http://waffle.io/weareinteractive/ansible-users)

> `users` is an [Ansible](http://www.ansible.com) role which:
> 
> * creates users
> * configures authorized keys
> * configures private ssh keys

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.users
```

Using `arm` ([Ansible Role Manager](https://github.com/mirskytech/ansible-role-manager/)):

```
$ arm install franklinkim.users
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-users.git
```

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# array of users to add
users: []
# default primary group for users
users_group: false
# default secondary groups
users_groups: []
```

A user might look like this:

```
# user's name
username: foobar    (required)
# user's full name
name: Foo Bar       (required)
# list of authorized keys 
authorized_keys:    (required)
  - "xxx\nxxx"
  - "xxx\nxxx"
# primary group
group: staff
# list of secondary groups
groups: ["adm", "www-data"]
# Change permission on users home directory
homeperms: 701
# private key
ssh_key: "xxx"
```

## Example playbook

```
- host: all
  sudo: yes
  roles: 
    - franklinkim.users
  vars:
    users:
      - username: foobar
        name: Foo Bar
        authorized_keys: []
    users_group: staff
    users_groups:
      - adm
      - www-data
```

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

