www_slcschools_org_env_test_django_settings_module:
  file.replace:
    - name: /etc/environment
    - repl: 'DJANGO_SETTINGS_MODULE="config.settings.test"'
    - pattern: 'DJANGO_SETTINGS_MODULE.*'
    - append_if_not_found: True
    - require:
      - sls: www_slcschools_org_gunicorn
www_slcschools_org_env_test_www_secret_key:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_SECRET_KEY=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1/G1kqiSg2WhtCFOUmIItjaGc2Wk1TIIbjOSJPpcS4Stb0o8I4efGQK\r\nrbwP2GMLm3n8EPKCo4wpEIV7Y7ulcg4p9wx8xT8faiY=' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_SECRET_KEY.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_django_settings_module
www_slcschools_org_env_test_www_db_name:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_NAME=\"{{ salt['cmd.run']("echo 'U2FsdGVkX18MTZmSbv9BfoHOq6igtU/9dRpg50nXt03zopBJ9b4otkbaPJHqZ1Ia' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_NAME.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_secret_key
www_slcschools_org_env_test_www_db_user:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_USER=\"{{ salt['cmd.run']("echo 'U2FsdGVkX18MTZmSbv9BfoHOq6igtU/9dRpg50nXt03zopBJ9b4otkbaPJHqZ1Ia' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_USER.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_db_name
www_slcschools_org_env_test_www_db_PASSWORD:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_PASSWORD=\"{{ salt['cmd.run']("echo 'U2FsdGVkX19Ex7byp1qb5qX4PDFfFCnHiDL+nvmAHLCO38tIdG8xbGp7hffL0jn+' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_PASSWORD.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_db_user
www_slcschools_org_env_test_www_db_host:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_HOST=\"{{ salt['cmd.run']("echo 'U2FsdGVkX199ILszBrrGMG4XiJF8DEDLXH442wGS0mo=' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_HOST.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_db_PASSWORD
www_slcschools_org_env_test_www_db_port:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_PORT=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1+u5H2qT4n5dub6xMwG8B9xFOGel9IQKeg=' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_PORT.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_db_host
www_slcschools_org_env_test_slcsd_ldap_user:
  file.replace:
    - name: /etc/environment
    - repl: "SLCSD_LDAP_USER=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1+GuFlZmN46/6+Gm8j5k3eDNkfuRU9nqX2aMwAvcj5JM7ljlRz++YpB' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'SLCSD_LDAP_USER.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_www_db_port
www_slcschools_org_env_test_slcsd_ldap_password:
  file.replace:
    - name: /etc/environment
    - repl: "SLCSD_LDAP_PASSWORD=\"{{ salt['cmd.run']("echo 'U2FsdGVkX19E75T5gzL3gfx9NORCLcTTAxM63N9fwxZe/CoOO7HKY5t1Zq5Umnxn\r\nLOdXd2DVNqov0tu5rWGF1g==' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'SLCSD_LDAP_PASSWORD.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_slcsd_ldap_user
importenviromentfile:
  file.replace:
    - name: /etc/profile
    - repl: 'source /etc/environment'
    - pattern: '^source \/etc\/environment$'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_test_slcsd_ldap_password
exportenviromentfile:
  file.replace:
    - name: /etc/profile
    - repl: 'export $(cut -d= -f1 /etc/environment)'
    - pattern: '^export \$\(cut -d= -f1 \/etc\/environment\)$'
    - append_if_not_found: True
    - require:
      - file: importenviromentfile
