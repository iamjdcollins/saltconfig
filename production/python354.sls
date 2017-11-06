mkpythonsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/python354
    - runas: root
    - onlyif: 'test ! -d /opt/software/python354'
    - require:
      - sls: python2-pip
downloadpython354:
  cmd.run:
    - name: curl https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tgz -o Python-3.5.4.tgz
    - cwd: /opt/software/python354
    - onlyif: 'test ! -e /opt/software/python354/Python-3.5.4.tgz'
    - runas: root
    - require:
      - cmd: mkpythonsrcdir
extractpython354:
  cmd.run:
    - name: tar xvzf Python-3.5.4.tgz
    - cwd: /opt/software/python354
    - onlyif: 'test ! -d /opt/software/python354/Python-3.5.4'
    - runas: root
    - require:
      - cmd: downloadpython354
configurepython354:
  cmd.run:
    - name: ./configure --enable-optimizations --prefix=/usr --exec-prefix=/usr --enable-shared && touch configurepython354.success
    - cwd: /opt/software/python354/Python-3.5.4
    - onlyif: 'test ! -e /opt/software/python354/Python-3.5.4/configurepython354.success'
    - runas: root
    - require:
      - cmd: extractpython354
makepython354:
  cmd.run:
    - name: make -j$(expr $(nproc) \* 2) && touch makepython354.success
    - cwd: /opt/software/python354/Python-3.5.4
    - onlyif: 'test ! -e /opt/software/python354/Python-3.5.4/makepython354.success'
    - runas: root
    - require:
      - cmd: configurepython354
installpython354:
  cmd.run:
    - name: make altinstall && touch installpython354.success
    - cwd: /opt/software/python354/Python-3.5.4
    - onlyif: 'test ! -e /opt/software/python354/Python-3.5.4/installpython354.success'
    - runas: root
    - require:
      - cmd: makepython354
ldconfigpython354:
  cmd.run:
    - name: ldconfig && touch ldconfigpython354.success
    - cwd: /opt/software/python354/Python-3.5.4
    - onlyif: 'test ! -e /opt/software/python354/Python-3.5.4/ldconfigpython354.success'
    - runas: root
    - require:
      - cmd: installpython354 
