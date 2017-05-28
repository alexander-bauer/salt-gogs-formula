# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent
{%- from "map.jinja" import gogs %}

gogs-group:
  group.present:
    - name: {{ gogs.config.main.run_user }}

gogs-user:
  user.present:
    - name: {{ gogs.config.main.run_user }}
    - gid: {{ gogs.config.main.run_user }}
    - shell: /bin/bash
    - home: {{ gogs.home_dir }}
    - groups: {{ gogs.groups | yaml }}
    - require:
      - group: gogs-group

