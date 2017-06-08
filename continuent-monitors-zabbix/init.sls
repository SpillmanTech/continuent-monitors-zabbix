{% from "continuent-monitors-zabbix/map.jinja" import monitors with context %}

setup_{{ monitors.config.thome }}:
  file.directory:
    - makedirs: True
    - name: {{ monitors.config.thome }}

continuent-monitors-zabbix-files:
  file.recurse:
    - source: salt://continuent-monitors-zabbix/files/zabbix*
    - name: {{ monitors.config.thome }}
