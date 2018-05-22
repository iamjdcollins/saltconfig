bryant_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/bryant.slcschools.org.conf
    - source: /etc/nginx/sites-enabled/bryant.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
bryant_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/bryant.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: bryant_slcschools_org_conf
bryant_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: bryant_slcschools_org_revslider_dir
