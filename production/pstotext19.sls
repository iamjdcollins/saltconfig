mkpstotextsrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/pstotext19
    - runas: root
    - onlyif: 'test ! -d /opt/software/pstotext19'
    - require:
      - sls: ghostscript-devel
downloadpstotext19:
  cmd.run:
    - name: curl http://slackbuilds.org/sources/13.0/pstotext-1.9.tar.gz -o pstotext-1.9.tar.gz
    - cwd: /opt/software/pstotext19
    - onlyif: 'test ! -e /opt/software/pstotext19/pstotext-1.9.tar.gz'
    - runas: root
    - require:
      - cmd: mkpstotextsrcdir
extractpstotext19:
  cmd.run:
    - name: tar xvzf pstotext-1.9.tar.gz
    - cwd: /opt/software/pstotext19
    - onlyif: 'test ! -d /opt/software/python354/pstotext-1.9'
    - runas: root
    - require:
      - cmd: downloadpstotext19
makepstotext19:
  cmd.run:
    - name: make -j$(expr $(nproc) \* 2) && touch makepstotext19.success
    - cwd: /opt/software/pstotext19/pstotext-1.9
    - onlyif: 'test ! -e /opt/software/pstotext19/pstotext-1.9/makepstotext19.success'
    - runas: root
    - require:
      - cmd: extractpstotext19
installpstotext19:
  cmd.run:
    - name: cp pstotext /usr/bin/ && touch installpstotext19.success
    - cwd: /opt/software/pstotext19/pstotext-1.9
    - onlyif: 'test ! -e /opt/software/pstotext19/pstotext-1.9/installpstotext19.success'
    - runas: root
    - require:
      - cmd: makepstotext19
chmodpstotext19:
  cmd.run:
    - name: chmod 755 /usr/bin/pstotext
    - runas: root
    - require:
      - cmd: installpstotext19
ldconfigpstotext19:
  cmd.run:
    - name: ldconfig && touch ldconfigpstotext19.success
    - cwd: /opt/software/pstotext19/pstotext-1.9
    - onlyif: 'test ! -e /opt/software/pstotext19/pstotext-1.9/ldconfigpstotext19.success'
    - runas: root
    - require:
      - cmd: chmodpstotext19
