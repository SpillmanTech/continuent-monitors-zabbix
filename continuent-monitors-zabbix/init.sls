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
    - user: tungsten
    - group: tungsten
    - file_mode: 700

{% set instance_this = DIR|replace('/cluster-home/bin', '') %}
{% set instance_dir = salt.file.basename( instance_this ) %}
continuent_monitors-zabbix-conf_{{ instance_dir }}:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.d/{{ instance_dir }}.conf
    - source: salt://continuent-monitors-zabbix/templates/conf.jinja
    - template: jinja
    - defaults: {{ monitors.config }}
    - context:
        DIR: {{ DIR }}

continuent_monitors-zabbix-agent_{{ instance_dir }}:
  service.running:
    - watch:
      - file: continuent_monitors-zabbix-conf_{{ instance_dir }}
{% endfor %}
