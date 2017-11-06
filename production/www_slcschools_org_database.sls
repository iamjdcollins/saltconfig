www_slcschools_org_database:
  postgres_database.present:
    - name: www_slcschools_org
    - user: postgres
    - db_user: postgres
    - db_password: {{ salt['cmd.run']("echo 'U2FsdGVkX18Y9n5ib96QsEjikwizD9Ab9xci6jG+Ha7TlZXgbaLnqpOVGCSTLveq' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}
    - require:
      - sls: postgresserver
www_slcschools_org_user:
  postgres_user.present:
    - name: www_slcschools_org
    - createdb: True
    - encrypted: True
    - password: {{ salt['cmd.run']("echo 'U2FsdGVkX19Ex7byp1qb5qX4PDFfFCnHiDL+nvmAHLCO38tIdG8xbGp7hffL0jn+' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}
    - user: postgres
    - db_user: postgres
    - db_password: {{ salt['cmd.run']("echo 'U2FsdGVkX18Y9n5ib96QsEjikwizD9Ab9xci6jG+Ha7TlZXgbaLnqpOVGCSTLveq' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}
    - require:
      - postgres_database: www_slcschools_org_database
www_slcschools_org_priv:
  postgres_privileges.present:
    - name: www_slcschools_org
    - object_name: www_slcschools_org
    - object_type: database
    - privileges: 
      - ALL
    - user: postgres
    - db_user: postgres
    - db_password: {{ salt['cmd.run']("echo 'U2FsdGVkX18Y9n5ib96QsEjikwizD9Ab9xci6jG+Ha7TlZXgbaLnqpOVGCSTLveq' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}
    - require:
      -  postgres_user: www_slcschools_org_user
www_slcschools_org_postgresselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/postgres/data
    - recursive: True
    - require:
      - postgres_privileges: www_slcschools_org_priv
