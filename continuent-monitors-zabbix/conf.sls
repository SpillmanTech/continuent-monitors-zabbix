{% from "continuent-monitors-zabbix/map.jinja" import continuent-monitors-zabbix, continuent-monitors-zabbix_config with context %}

include:
  - continuent-monitors-zabbix

continuent-monitors-zabbix-config:
  file.managed:
    - name: {{ continuent-monitors-zabbix.conf_file }}
    - source: salt://continuent-monitors-zabbix/templates/conf.jinja
    - template: jinja
    - context:
      config: {{ continuent-monitors-zabbix_config }}
    - watch_in:
      - service: continuent-monitors-zabbix
    - require:
      - pkg: continuent-monitors-zabbix
