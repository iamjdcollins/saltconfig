include:
  - slcschools_org_cert

www_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/www_slcschools_org.conf
    - source: /srv/salt/files/nginx/www_slcschools_org.conf
    - replace: True
    - require:
      - sls: www_slcschools_org_gunicorn
      - sls: slcschools_org_cert
www_slcschools_org_dir:
  file.directory:
    - name: /srv/nginx/www_slcschools_org
    - user: nginx
    - group: webmaster
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: www_slcschools_org_conf
