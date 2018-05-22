profile_source_enviroment:
  file.replace:
    - name: /etc/profile
    - repl: 'source /etc/environment'
    - pattern: 'source \/etc\/environment'
    - append_if_not_found: True
    - require:
      - sls: webmasteraccount 
profile_export_enviroment:
  file.replace:
    - name: /etc/profile
    - repl: 'export $(cut -d= -f1 /etc/environment)'
    - pattern: 'export \$\(cut \-d\= \-f1 \/etc\/environment\)'
    - append_if_not_found: True
    - require:
      - file: profile_source_enviroment
environment_file:
  file.managed:
    - name: /etc/environment
    - source: /srv/salt/files/etc/environment
    - replace: False 
