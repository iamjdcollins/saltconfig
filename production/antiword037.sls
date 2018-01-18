mkantiwordsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/antiword037
    - runas: root
    - onlyif: 'test ! -d /opt/software/antiword037'
    - require:
      - sls: python354
downloadantiword037:
  cmd.run:
    - name: curl http://www.winfield.demon.nl/linux/antiword-0.37.tar.gz -o antiword-0.37.tar.gz
    - cwd: /opt/software/antiword037
    - onlyif: 'test ! -e /opt/software/antiword037/antiword-0.37.tar.gz'
    - runas: root
    - require:
      - cmd: mkantiwordsrcdir
extractantiword037:
  cmd.run:
    - name: tar xvzf antiword-0.37.tar.gz
    - cwd: /opt/software/antiword037
    - onlyif: 'test ! -d /opt/software/python354/antiword-0.37'
    - runas: root
    - require:
      - cmd: downloadantiword037
makeantiword037:
  cmd.run:
    - name: make -j$(expr $(nproc) \* 2) && touch makeantiword037.success
    - cwd: /opt/software/antiword037/antiword-0.37
    - onlyif: 'test ! -e /opt/software/antiword037/antiword-0.37/makeantiword037.success'
    - runas: root
    - require:
      - cmd: extractantiword037
installantiword037:
  cmd.run:
    - name: cp antiword kantiword /usr/bin/ && touch installantiword037.success
    - cwd: /opt/software/antiword037/antiword-0.37
    - onlyif: 'test ! -e /opt/software/antiword037/antiword-0.37/installantiword037.success'
    - runas: root
    - require:
      - cmd: makeantiword037
chmodantiword037:
  cmd.run:
    - name: chmod 755 /usr/bin/antiword /usr/bin/kantiword
    - runas: root
    - require:
      - cmd: installantiword037
resourcesantiword037:
  cmd.run:
    - name: cp -R Resources /usr/share/antiword && touch resourcesantiword037.success
    - cwd: /opt/software/antiword037/antiword-0.37
    - onlyif: 'test ! -e /opt/software/antiword037/antiword-0.37/resourcesantiword037.success'
    - runas: root
    - require:
      - cmd: chmodantiword037
chmodresourcesantiword037:
  cmd.run:
    - name: chmod -R 755 /usr/share/antiword
    - runas: root
    - require:
      - cmd: resourcesantiword037
ldconfigantiword037:
  cmd.run:
    - name: ldconfig && touch ldconfigantiword037.success
    - cwd: /opt/software/antiword037/antiword-0.37
    - onlyif: 'test ! -e /opt/software/antiword037/antiword-0.37/ldconfigantiword037.success'
    - runas: root
    - require:
      - cmd: chmodresourcesantiword037
