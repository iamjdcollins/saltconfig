www_slcschools_org_env_dev_django_settings_module:
  file.replace:
    - name: /etc/environment
    - repl: 'DJANGO_SETTINGS_MODULE="config.settings.development"'
    - pattern: 'DJANGO_SETTINGS_MODULE.*'
    - append_if_not_found: True
    - require:
      - sls: www_slcschools_org_gunicorn
www_slcschools_org_env_dev_www_secret_key:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_SECRET_KEY=\"{{ salt['cmd.run']("echo 'U2FsdGVkX19fDwy5bk1b3h4/ewDmDqzXvEQbnM2D9gFSK1VXBs/2k22UXy7eAEYLShQ2RQp6buvUZFF1LzW/LRvRWB0Mx1Reneb5tS9qAu0=' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_SECRET_KEY.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_django_settings_module
www_slcschools_org_env_dev_www_db_name:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_NAME=\"{{ salt['cmd.run']("echo 'U2FsdGVkX18MTZmSbv9BfoHOq6igtU/9dRpg50nXt03zopBJ9b4otkbaPJHqZ1Ia' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_NAME.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_secret_key
www_slcschools_org_env_dev_www_db_user:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_USER=\"{{ salt['cmd.run']("echo 'U2FsdGVkX18MTZmSbv9BfoHOq6igtU/9dRpg50nXt03zopBJ9b4otkbaPJHqZ1Ia' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_USER.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_db_name
www_slcschools_org_env_dev_www_db_PASSWORD:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_PASSWORD=\"{{ salt['cmd.run']("echo 'U2FsdGVkX19Ex7byp1qb5qX4PDFfFCnHiDL+nvmAHLCO38tIdG8xbGp7hffL0jn+' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_PASSWORD.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_db_user
www_slcschools_org_env_dev_www_db_host:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_HOST=\"{{ salt['cmd.run']("echo 'U2FsdGVkX199ILszBrrGMG4XiJF8DEDLXH442wGS0mo=' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_HOST.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_db_PASSWORD
www_slcschools_org_env_dev_www_db_port:
  file.replace:
    - name: /etc/environment
    - repl: "WWW_DB_PORT=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1+u5H2qT4n5dub6xMwG8B9xFOGel9IQKeg=' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'WWW_DB_PORT.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_db_host
www_slcschools_org_env_dev_slcsd_ldap_user:
  file.replace:
    - name: /etc/environment
    - repl: "SLCSD_LDAP_USER=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1+26tQVstiftf49abrv6mEOc5xxX0CCYu8=' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'SLCSD_LDAP_USER.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_www_db_port
www_slcschools_org_env_dev_slcsd_ldap_password:
  file.replace:
    - name: /etc/environment
    - repl: "SLCSD_LDAP_PASSWORD=\"{{ salt['cmd.run']("echo 'U2FsdGVkX1+Hg/BCxq2TDZY7uaP4TgSE0Ya0uAB/iLyPxOA5fOefZXSW7vuhOyEhAJCaa80DSBFhfHSr9vw8Zw==' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}\""
    - pattern: 'SLCSD_LDAP_PASSWORD.*'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_slcsd_ldap_user
importenviromentfile:
  file.replace:
    - name: /etc/profile
    - repl: 'source /etc/environment'
    - pattern: '^source \/etc\/environment$'
    - append_if_not_found: True
    - require:
      - file: www_slcschools_org_env_dev_slcsd_ldap_password
exportenviromentfile:
  file.replace:
    - name: /etc/profile
    - repl: 'export $(cut -d= -f1 /etc/environment)'
    - pattern: '^export \$\(cut -d= -f1 \/etc\/environment\)$'
    - append_if_not_found: True
    - require:
      - file: importenviromentfile
