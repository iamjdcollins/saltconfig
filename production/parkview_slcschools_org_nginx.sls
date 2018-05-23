parkview_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/parkview.slcschools.org.conf
    - source: /srv/salt/files/etc/nginx/sites-enabled/parkview.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
parkview_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/parkview.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: parkview_slcschools_org_conf
parkview_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: parkview_slcschools_org_revslider_dir
