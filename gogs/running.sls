# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent
{% from "gogs/map.jinja" import gogs %}

gogs-service:
  file.managed:
    - name: {{ gogs.lookup.service_file }}
    - source: {{ gogs.lookup.service_source }}
    - template: jinja

gogs-running:
  service.running:
    - name: gogs
    - enable: true
    - require:
      - file: gogs-service
    - watch:
      - file: gogs-conf-ini
