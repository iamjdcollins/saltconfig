postgresgroup:
  group.present:
    - name: postgres
    - gid: 10000
    - system: True
    - require:
      - sls: postgresql964
postgresuser:
  user.present:
    - name: postgres
    - uid: 10000
    - gid: 10000
    - createhome: True
    - empty_password: False
    - shell: /bin/bash
    - fullname: 'Postgres System User'
    - require: 
      - group: postgresgroup
/srv/postgres:
  file.directory:
    - user: postgres
    - group: postgres
    - mode: 755
    - makedirs: True
    - require:
      - user: postgresuser
/srv/postgres/data:
  file.directory:
    - user: postgres
    - group: postgres
    - mode: 700
    - recurse:
      - user
      - group
      - mode
    - makedirs: True
    - require:
      - file: /srv/postgres
postgresinitdb:
  postgres_initdb.present:
    - name: /srv/postgres/data
    - auth: password
    - user: postgres
    - password: {{ salt['cmd.run']("echo 'U2FsdGVkX18Y9n5ib96QsEjikwizD9Ab9xci6jG+Ha7TlZXgbaLnqpOVGCSTLveq' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64",python_shell=True) }}
    - encoding: UTF8
    - locale: C
    - runas: postgres
    - require:
      - file: /srv/postgres/data
postgresservicefile:
  file.managed:
    - name: /usr/lib/systemd/system/postgresql.service
    - source: /srv/salt/files/postgres/postgresql.service
    - user: root
    - group: root
    - mode: 644
    - require:
      -  postgres_initdb: postgresinitdb
postgresselinuxpresent:
  selinux.fcontext_policy_present:
    - name: /srv/postgres/data(/.*)?
    - sel_type: postgresql_db_t
    - require:
      - file: postgresservicefile
postgresselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/postgres/data
    - recursive: False
    - require:
      - selinux: postgresselinuxpresent
postgresservice:
  service.running:
    - name: postgresql.service
    - enable: True
    - require:
      - selinux: postgresselinuxapplied
