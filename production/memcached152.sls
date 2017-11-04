mkmemcachedsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/memcached152
    - runas: root
    - onlyif: 'test ! -d /opt/software/memcached152'
    - require:
      - pkg: libevent
downloadmemcached152:
  cmd.run:
    - name: curl http://www.memcached.org/files/memcached-1.5.2.tar.gz -o memcached-1.5.2.tar.gz
    - cwd: /opt/software/memcached152
    - onlyif: 'test ! -e /opt/software/memcached152/memcached-1.5.2.tar.gz'
    - runas: root
extractmemcached152:
  cmd.run:
    - name: tar xvzf memcached-1.5.2.tar.gz
    - cwd: /opt/software/memcached152
    - onlyif: 'test ! -d /opt/software/memcached152/memcached-1.5.2'
    - runas: root
configurememcached152:
  cmd.run:
    - name: ./configure --prefix=/ --exec-prefix=/usr --includedir=/usr/include --datarootdir=/usr/share && touch configurememcached152.success
    - cwd: /opt/software/memcached152/memcached-1.5.2
    - onlyif: 'test ! -e /opt/software/memcached152/memcached-1.5.2/configurememcached152.success'
    - runas: root
makememcached152:
  cmd.run:
    - name: make && touch makememcached152.success
    - cwd: /opt/software/memcached152/memcached-1.5.2
    - onlyif: 'test ! -e /opt/software//memcached152/memcached-1.5.2/makememcached152.success'
    - runas: root
installmemcached152:
  cmd.run:
    - name: make install && touch installmemcached152.success
    - cwd: /opt/software/memcached152/memcached-1.5.2
    - onlyif: 'test ! -e /opt/software/memcached152/memcached-1.5.2/installmemcached152.success'
    - runas: root
ldconfigmemcached152:
  cmd.run:
    - name: ldconfig && touch ldconfigmemcached152.success
    - cwd: /opt/software/memcached152/memcached-1.5.2
    - onlyif: 'test ! -e /opt/software/memcached152/memcached-1.5.2/ldconfigmemcached152.success'
    - runas: root
