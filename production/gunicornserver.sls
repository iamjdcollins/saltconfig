gunicornrundirectory:
  file.directory:
    - name: /run/gunicorn
    - user: nginx
    - group: nginx
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - require:
      - sls: nginxserver
gunicorntmpfiles:
  file.managed:
    - name: /usr/lib/tmpfiles.d/gunicorn.conf
    - source: /srv/salt/files/tmpfiles.d/gunicorn.conf
    - replace: True
    - require:
      - file: gunicornrundirectory
