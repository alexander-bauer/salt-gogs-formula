# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent
{%- from "gogs/map.jinja" import gogs %}

gogs-user-home:
  file.directory:
    - name: {{ gogs.home_dir }}

gogs-group:
  group.present:
    - name: {{ gogs.config.main.run_user }}

gogs-user:
  user.present:
    - name: {{ gogs.config.main.run_user }}
    - gid: {{ gogs.config.main.run_user }}
    - groups: {{ gogs.groups | yaml }}
    - shell: /bin/bash
    - home: {{ gogs.home_dir }}
    - require:
      - file: gogs-user-home
      - group: gogs-group
