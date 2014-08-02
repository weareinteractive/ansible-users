# Ansible Users Role

[![Build Status](https://travis-ci.org/weareinteractive/ansible-role-users.png?branch=master)](https://travis-ci.org/weareinteractive/ansible-role-users)
[![Stories in Ready](https://badge.waffle.io/weareinteractive/ansible-role-users.svg?label=ready&title=Ready)](http://waffle.io/weareinteractive/ansible-role-users)

> `users` is an [Ansible](http://www.ansible.com) role which:
> 
> * creates users
> * adds private ssh keys
> * adds authorized keys

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
$ git clone https://github.com/weareinteractive/ansible-role-users.git
```

## Variables

```
# users:
#   - username: foobar (required)
#     name: Foo Bar (required)
#     authorized_keys: (required)
#       - "xxx"
#       - "xxx"
#     group: staff
#     groups: ["adm", "www-data"]
#     ssh_key: "xxx"
#

# array of users to add
users: []
# default primary group for users. `false` if username should be used
users_group: false
# default secondary groups
users_groups: []
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
$ git clone https://github.com/weareinteractive/ansible-role-users.git
$ cd ansible-role-users
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

