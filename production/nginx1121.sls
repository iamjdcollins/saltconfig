mknginxsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/nginx1121
    - runas: root
    - onlyif: 'test ! -d /opt/software/nginx1121'
    - require:
      - sls: postgresql964
downloadnginx1121:
  cmd.run:
    - name: curl https://nginx.org/download/nginx-1.12.1.tar.gz -o nginx-1.12.1.tar.gz
    - cwd: /opt/software/nginx1121
    - onlyif: 'test ! -e /opt/software/nginx1121/nginx-1.12.1.tar.gz'
    - runas: root
    - require:
      - cmd: mknginxsrcdir
extractnginx1121:
  cmd.run:
    - name: tar xvzf nginx-1.12.1.tar.gz
    - cwd: /opt/software/nginx1121
    - onlyif: 'test ! -d /opt/software/nginx1121/nginx-1.12.1'
    - runas: root
    - require:
      - cmd: downloadnginx1121
configurenginx1121:
  cmd.run:
    - name: ./configure --prefix=/usr --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/run/lock/nginx/nginx.lock --modules-path=/usr/local/nginx/modules --with-http_ssl_module --user=nginx --group=nginx && touch configurenginx1121.success
    - cwd: /opt/software/nginx1121/nginx-1.12.1
    - onlyif: 'test ! -e /opt/software/nginx1121/nginx-1.12.1/configurenginx1121.success'
    - runas: root
    - require:
      - cmd: extractnginx1121
makenginx1121:
  cmd.run:
    - name: make && touch makenginx1121.success
    - cwd: /opt/software/nginx1121/nginx-1.12.1
    - onlyif: 'test ! -e /opt/software//nginx1121/nginx-1.12.1/makenginx1121.success'
    - runas: root
    - require:
      - cmd: configurenginx1121
installnginx1121:
  cmd.run:
    - name: make install && touch installnginx1121.success
    - cwd: /opt/software/nginx1121/nginx-1.12.1
    - onlyif: 'test ! -e /opt/software/nginx1121/nginx-1.12.1/installnginx1121.success'
    - runas: root
    - require:
      - cmd: makenginx1121
ldconfignginx1121:
  cmd.run:
    - name: ldconfig && touch ldconfignginx1121.success
    - cwd: /opt/software/nginx1121/nginx-1.12.1
    - onlyif: 'test ! -e /opt/software/nginx1121/nginx-1.12.1/ldconfignginx1121.success'
    - runas: root
    - require:
      - cmd: installnginx1121
