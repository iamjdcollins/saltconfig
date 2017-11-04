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
