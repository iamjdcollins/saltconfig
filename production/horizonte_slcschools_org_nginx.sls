horizonte_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/horizonte.slcschools.org.conf
    - source: /etc/nginx/sites-enabled/horizonte.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
horizonte_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/horizonte.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: horizonte_slcschools_org_conf
horizonte_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: horizonte_slcschools_org_revslider_dir
