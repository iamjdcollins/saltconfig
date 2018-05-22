escalante_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/escalante.slcschools.org.conf
    - source: /etc/nginx/sites-enabled/escalante.slcschools.org.conf
    - replace: True
    - require:
      - sls: websites_slcschools_org_nginx
      - sls: revslider
escalante_slcschools_org_revslider_dir:
  file.directory:
    - name: /srv/nginx/revslider/escalante.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: escalante_slcschools_org_conf
escalante_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: escalante_slcschools_org_revslider_dir
