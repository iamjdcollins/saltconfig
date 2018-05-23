riley_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/riley.slcschools.org.conf
    - source: /srv/salt/files/etc/nginx/sites-enabled/riley.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
riley_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/riley.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: riley_slcschools_org_conf
riley_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: riley_slcschools_org_revslider_dir
