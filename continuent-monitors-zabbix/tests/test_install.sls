{% from "continuent-monitors-zabbix/map.jinja" import continuent-monitors-zabbix with context %}

{% for pkg in continuent-monitors-zabbix.pkgs %}
test_{{pkg}}_is_installed:
  testinfra.package:
    - name: {{ pkg }}
    - is_installed: True
{% endfor %}
