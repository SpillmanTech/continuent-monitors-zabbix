{% from "continuent-monitors-zabbix/map.jinja" import monitors with context %}

{% for DIR in salt.file.find( monitors.config.thome, type='d') %}
setup_{{ DIR }}:
  file.directory:
    - makedirs: True
    - name: {{ DIR }}

continuent-monitors-zabbix-files_{{ DIR }}:
  file.recurse:
    - source: salt://continuent-monitors-zabbix/files
    - name: {{ DIR }}
{% endfor %}
