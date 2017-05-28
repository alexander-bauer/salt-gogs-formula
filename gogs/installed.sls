# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent
{%- from "map.jinja" import gogs %}

gogs-requirements:
  pkg.latest:
    - pkgs:
      - git

gogs-installed:
  archive.extracted:
    - name: /opt/
    - source: {{ gogs.download_url }}
    {%- if gogs.hash %}
    - source_hash: {{ gogs.hash }}
    {%- endif %}
    - archive_format: tar
    - if_missing: /opt/gogs
  file.directory:
    - name: /opt/gogs/
    - user: {{ gogs.config.main.run_user }}
    - group: {{ gogs.config.main.run_user }}
    - recurse:
       - user
       - group

{%- if gogs.logs_dir %}
gogs-logs-dir:
  file.directory:
    - name: {{ gogs.logs_dir }}
    - user: {{ gogs.config.main.run_user }}
    - group: adm
    - dir_mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{%- endif %}
