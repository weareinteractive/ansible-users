<a name="1.7.1"></a>
### 1.7.1 (2017-02-14)


#### Features

*   add update_password flag ([d3511ffe](https://github.com/weareinteractive/ansible-users/commit/d3511ffee448b691965ad4b976a7b32e7dc8824d))



<a name="1.7.0"></a>
## 1.7.0 (2016-08-02)


#### Features

*   add `users_remove` ([d06f860d](https://github.com/weareinteractive/ansible-users/commit/d06f860d064da9115331224ec16fcfe5db91fa82))
*   optimize authorized keys management ([382d7c2e](https://github.com/weareinteractive/ansible-users/commit/382d7c2e9f7edc987c2f8b0679fc27cdfdc9c6b6))



<a name="1.6.1"></a>
### 1.6.1 (2016-05-30)




<a name="1.6.0"></a>
## 1.6.0 (2016-05-09)


#### Features

*   add password and shell variables ([93b48f0e](https://github.com/weareinteractive/ansible-users/commit/93b48f0eb0e9c547717a5679f9dbc14a18d32b17))



<a name="1.5.0"></a>
## 1.5.0 (2016-04-18)


#### Bug Fixes

*   fix 'when' clause when adding the primary user group ([9fec282d](https://github.com/weareinteractive/ansible-users/commit/9fec282d4635eeb808837c4ce9ddfed25ce7bffd))
*   fix deprecation warnings in ansible 2.0


<a name="1.4.0"></a>
## 1.4.0 (2016-04-14)


#### Features

*   make sure groups are available ([232fe41b](https://github.com/weareinteractive/ansible-users/commit/232fe41b47372177492789e7a9f1ee5bb851de2e))



<a name="1.3.0"></a>
## 1.3.0 (2015-12-11)


#### Breaking Changes

*   move config.yml tasks to manage.yml since it belongs in that context ([a1edf947](https://github.com/weareinteractive/ansible-users/commit/a1edf94719275b4f204105807ee32d21dd3319d2))

#### Features

*   adds galaxy_tags ([082d43cd](https://github.com/weareinteractive/ansible-users/commit/082d43cd4cadbfacb9e6c57e54dfdf3d17f31db8))
*   move config.yml tasks to manage.yml since it belongs in that context ([a1edf947](https://github.com/weareinteractive/ansible-users/commit/a1edf94719275b4f204105807ee32d21dd3319d2))
*   adds CHANGELOG ([3a39f74c](https://github.com/weareinteractive/ansible-users/commit/3a39f74cb6ba1bea4fda7483122bae889ac6251e))
*   using ansible-role docgen for README geneartion ([7c16c027](https://github.com/weareinteractive/ansible-users/commit/7c16c02716a65af4e90916bf88bf0083a5a902d1))
*   use `authorized_key` module instead of template ([a6d96f43](https://github.com/weareinteractive/ansible-users/commit/a6d96f4358e601c9c634b43629e8e9304f0e395e), closes [#5](https://github.com/weareinteractive/ansible-users/issues/5))
