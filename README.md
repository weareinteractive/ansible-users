# Ansible franklinkim.users role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-users.svg)](https://travis-ci.org/weareinteractive/ansible-users)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.sudo-blue.svg)](https://galaxy.ansible.com/list#/roles/1385)
[![GitHub tag](https://img.shields.io/github/tag/weareinteractive/ansible-users.svg)](https://github.com/weareinteractive/ansible-users/releases)
[![GitHub stars](https://img.shields.io/github/stars/weareinteractive/ansible-users.svg?style=social&label=Star)](https://github.com/weareinteractive/ansible-users)

> `franklinkim.users` is an [Ansible](http://www.ansible.com) role which:
>
> * manges users
> * manages user's private key
> * manages user's authorized keys

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install franklinkim.users
```

Using `requirements.yml`:

```yaml
- src: franklinkim.users
```

Using `git`:

```shell
$ git clone https://github.com/weareinteractive/ansible-users.git franklinkim.users
```

## Dependencies

* Ansible >= 1.9

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---
# @see http://docs.ansible.com/ansible/user_module.html
#
# users:
#   - username: foobar              (required)
#     name: Foo Bar
#     uid: 1000
#     group: staff
#     password: xxxxx
#     groups: ["adm", "www-data"]
#     home_mode: "0750"
#     home_create: yes
#     home: /path/to/user/home
#     system: no
#     authorized_keys: []           (required)
#     ssh_key_type: rsa
#     ssh_key_bits: 2048
#     ssh_key_password: ""
#     ssh_key_generate: no
#     ssh_key: "xxx"
#     shell: /bin/bash
#

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


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  sudo: yes
  roles:
    - franklinkim.users
  vars:
    users:
      - username: foobar
        name: Foo Bar 1
        authorized_keys: []
      - username: foobar_authorized_keys
        authorized_keys:
          - "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
        home_create: yes
      - username: foobar_nohome
        authorized_keys: []
        home_create: no
      - username: foobar_groups
        authorized_keys: []
        groups:
          - users
      - username: foobar_groups_reset
        authorized_keys: []
        groups: []
        group: foobar_groups_reset
      - username: foobar_home_mode
        authorized_keys: []
        home_mode: "0750"
      - username: foobar_key
        authorized_keys: []
        ssh_key: "-----BEGIN RSA PRIVATE KEY-----\nMIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI\nw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP\nkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2\nhMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO\nTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW\nyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd\nELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1\nBw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf\nTK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK\niqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A\nsClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf\n4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP\ncXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk\nEjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN\nCAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX\n3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG\nYEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj\n3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+\ndBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz\n6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC\nP9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF\nllYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ\nkda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH\n+vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ\nNE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=\n-----END RSA PRIVATE KEY-----\n"
      - username: foobar_key_generate
        authorized_keys: []
        ssh_key_generate: yes
        ssh_key_password: secret
      - username: foobar_system
        authorized_keys: []
        system: yes
    users_group: staff
    users_groups:
      - www-data

```


## Testing

```shell
$ git clone https://github.com/weareinteractive/ansible-users.git
$ cd ansible-users
$ make test
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c) We Are Interactive under the MIT license.
