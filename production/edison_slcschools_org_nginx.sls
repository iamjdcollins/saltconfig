edison_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/edison.slcschools.org.conf
    - source: /etc/nginx/sites-enabled/edison.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
edison_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/edison.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: edison_slcschools_org_conf
edison_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: edison_slcschools_org_revslider_dir
