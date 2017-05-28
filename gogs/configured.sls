{% from "gogs/map.jinja" import gogs %}
gogs-conf-ini:
  file.managed:
    - name: {{ gogs.home_dir }}/custom/conf/app.ini
    - source: salt://gogs/files/gogs-app.ini
    - user: {{ gogs.config.main.run_user }}
    - group: {{ gogs.config.main.run_user }}
    - makedirs: True
