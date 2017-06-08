{% from "continuent-monitors-zabbix/map.jinja" import continuent-monitors-zabbix with context %}

continuent-monitors-zabbix:
  pkg.installed:
    - pkgs: {{ continuent-monitors-zabbix.pkgs }}
  service:
    - running
    - name: {{ continuent-monitors-zabbix.service }}
    - enable: True
    - require:
      - pkg: continuent-monitors-zabbix
