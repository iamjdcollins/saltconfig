mkpopplerdatasrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/popplerdata048
    - runas: root
    - onlyif: 'test ! -d /opt/software/popplerdata048'
    - require:
      - sls: poppler0620
downloadpopplerdata048:
  cmd.run:
    - name: curl https://poppler.freedesktop.org/poppler-data-0.4.8.tar.gz -o poppler-data-0.4.8.tar.gz
    - cwd: /opt/software/popplerdata048
    - onlyif: 'test ! -e /opt/software/popplerdata048/poppler-data-0.4.8.tar.gz'
    - runas: root
    - require:
      - cmd: mkpopplerdatasrcdir
extractpopplerdata048:
  cmd.run:
    - name: tar xvzf poppler-data-0.4.8.tar.gz
    - cwd: /opt/software/popplerdata048
    - onlyif: 'test ! -d /opt/software/popplerdata048/poppler-data-0.4.8'
    - runas: root
    - require:
      - cmd: downloadpopplerdata048
installpopplerdata048:
  cmd.run:
    - name: make install prefix=/usr && touch installpopplerdata048.success
    - cwd: /opt/software/popplerdata048/poppler-data-0.4.8
    - onlyif: 'test ! -e /opt/software/popplerdata048/poppler-data-0.4.8/installpoppler048.success'
    - runas: root
    - require:
      - cmd: extractpopplerdata048
ldconfigpopplerdata048:
  cmd.run:
    - name: ldconfig && touch ldconfigpopplerdata048.success
    - cwd: /opt/software/popplerdata048/poppler-data-0.4.8
    - onlyif: 'test ! -e /opt/software/popplerdata048/poppler-data-0.4.8/ldconfigpoppler048.success'
    - runas: root
    - require:
      - cmd: installpopplerdata048
