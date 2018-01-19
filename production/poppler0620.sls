mkpopplersrcdir:
  cmd.run:
    - name: mkdir -p /opt/software/poppler0620
    - runas: root
    - onlyif: 'test ! -d /opt/software/poppler0620'
    - require:
      - sls: libtiff-devel
downloadpoppler0620:
  cmd.run:
    - name: curl https://poppler.freedesktop.org/poppler-0.62.0.tar.xz -o poppler-0.62.0.tar.xz
    - cwd: /opt/software/poppler0620
    - onlyif: 'test ! -e /opt/software/poppler0620/poppler-0.62.0.tar.xz'
    - runas: root
    - require:
      - cmd: mkpopplersrcdir
extractpoppler0620:
  cmd.run:
    - name: tar xvJf poppler-0.62.0.tar.xz
    - cwd: /opt/software/poppler0620
    - onlyif: 'test ! -d /opt/software/poppler0620/poppler-0.62.0'
    - runas: root
    - require:
      - cmd: downloadpoppler0620
mkpopplerbuilddir:
  cmd.run:
    - name: mkdir -p /opt/software/poppler0620/poppler-0.62.0/build
    - runas: root
    - onlyif: 'test ! -d /opt/software/poppler0620/poppler-0.62.0/build'
    - require:
      - cmd: extractpoppler0620
configurepoppler0620:
  cmd.run:
    - name: cmake3 .. -DCMAKE_INSTALL_PREFIX=/usr && touch configurepoppler0620.success
    - cwd: /opt/software/poppler0620/poppler-0.62.0/build
    - onlyif: 'test ! -e /opt/software/poppler0620/poppler-0.62.0/build/configurepoppler0620.success'
    - runas: root
    - require:
      - cmd: mkpopplerbuilddir
makepoppler0620:
  cmd.run:
    - name: make -j$(expr $(nproc) \* 2) && touch makepoppler0620.success
    - cwd: /opt/software/poppler0620/poppler-0.62.0/build
    - onlyif: 'test ! -e /opt/software/poppler0620/poppler-0.62.0/build/makepoppler0620.success'
    - runas: root
    - require:
      - cmd: configurepoppler0620
installpoppler0620:
  cmd.run:
    - name: make install && touch installpoppler0620.success
    - cwd: /opt/software/poppler0620/poppler-0.62.0/build
    - onlyif: 'test ! -e /opt/software/poppler0620/poppler-0.62.0/build/installpoppler0620.success'
    - runas: root
    - require:
      - cmd: makepoppler0620
ldconfigpoppler0620:
  cmd.run:
    - name: ldconfig && touch ldconfigpoppler0620.success
    - cwd: /opt/software/poppler0620/poppler-0.62.0/build
    - onlyif: 'test ! -e /opt/software/poppler0620/poppler-0.62.0/build/ldconfigpoppler0620.success'
    - runas: root
    - require:
      - cmd: installpoppler0620
