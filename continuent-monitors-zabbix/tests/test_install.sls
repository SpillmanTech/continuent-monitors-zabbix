{% from "continuent-monitors-zabbix/map.jinja" import monitors with context %}

#{% for pkg in monitors.pkgs %}
#test_{{pkg}}_is_installed:
#  testinfra.package:
#    - name: {{ pkg }}
#    - is_installed: True
#{% endfor %}
