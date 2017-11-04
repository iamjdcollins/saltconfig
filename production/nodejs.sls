mknodedir:
  cmd.run:
    - name: mkdir -p /opt/software/nodejs
    - runas: root
    - onlyif: 'test ! -d /opt/software/nodejs'
    - require:
      - sls: libevent
downloadnode:
  cmd.run:
    - name: curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash - && touch downloadnodejs.success
    - cwd: /opt/software/nodejs
    - onlyif: 'test ! -e /opt/software/nodejs/downloadnodejs.success'
    - runas: root
    - require:
      - cmd: mknodedir
nodejs:
  pkg.installed:
    - require:
      - cmd: downloadnode
