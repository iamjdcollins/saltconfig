mkpostgresqlsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/postgresql964
    - runas: root
    - onlyif: 'test ! -d /opt/software/postgresql964'
    - require:
      - sls: pipvirtualenv3
downloadpostgresql964:
  cmd.run:
    - name: curl https://ftp.postgresql.org/pub/source/v9.6.4/postgresql-9.6.4.tar.gz -o postgresql-9.6.4.tar.gz
    - cwd: /opt/software/postgresql964
    - onlyif: 'test ! -e /opt/software/postgresql964/postgresql-9.6.4.tar.gz'
    - runas: root
    - require:
      - cmd: mkpostgresqlsrcdir
extractpostgresql964:
  cmd.run:
    - name: tar xvzf postgresql-9.6.4.tar.gz
    - cwd: /opt/software/postgresql964
    - onlyif: 'test ! -d /opt/software/postgresql964/postgresql-9.6.4'
    - runas: root
    - require:
      - cmd: downloadpostgresql964
configurepostgresql964:
  cmd.run:
    - name: ./configure --prefix=/usr --exec-prefix=/usr --with-python PYTHON=/usr/bin/python3.5m && touch configurepostgresql964.success
    - cwd: /opt/software/postgresql964/postgresql-9.6.4
    - onlyif: 'test ! -e /opt/software/postgresql964/postgresql-9.6.4/configurepostgresql964.success'
    - runas: root
    - require:
      - cmd: extractpostgresql964
makepostgresql964:
  cmd.run:
    - name: make && touch makepostgresql964.success
    - cwd: /opt/software/postgresql964/postgresql-9.6.4
    - onlyif: 'test ! -e /opt/software/postgresql964/postgresql-9.6.4/makepostgresql964.success'
    - runas: root
    - require:
      - cmd: configurepostgresql964
installpostgresql964:
  cmd.run:
    - name: make install && touch installpostgresql964.success
    - cwd: /opt/software/postgresql964/postgresql-9.6.4
    - onlyif: 'test ! -e /opt/software/postgresql964/postgresql-9.6.4/installpostgresql964.success'
    - runas: root
    - require:
      - cmd: makepostgresql964
ldconfigpostgresql964:
  cmd.run:
    - name: ldconfig && touch ldconfigpostgresql964.success
    - cwd: /opt/software/postgresql964/postgresql-9.6.4
    - onlyif: 'test ! -e /opt/software/postgresql964/postgresql-9.6.4/ldconfigpostgresql964.success'
    - runas: root
    - reload_modules: True
    - require:
      - cmd: installpostgresql964
sync_all_postgresql964:
  module.run:
    - name: saltutil.sync_all
    - refresh: True
    - require:
      - cmd: ldconfigpostgresql964
