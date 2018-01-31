include:
  - slcschools_org_cert

www_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/www.slcschools.org.conf
    - source: /srv/salt/files/nginx/www.slcschools.org.conf
    - replace: True
    - require:
      - sls: www_slcschools_org_gunicorn
      - sls: slcschools_org_cert
www_slcschools_org_dir:
  file.directory:
    - name: /srv/nginx/www.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: www_slcschools_org_conf
www_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: www_slcschools_org_dir
www_slcschools_org_defaultgroupacl:
  acl.present:
    - name: /srv/nginx/www.slcschools.org
    - acl_type: d:g
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - selinux: www_slcschools_org_nginxselinuxapplied
www_slcschools_org_defaultuseracl:
  acl.present:
    - name: /srv/nginx/www.slcschools.org
    - acl_type: d:u
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: www_slcschools_org_defaultgroupacl
www_slcschools_org_groupacl:
  acl.present:
    - name: /srv/nginx/www.slcschools.org
    - acl_type: group
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: www_slcschools_org_defaultuseracl
www_slcschools_org_useracl:
  acl.present:
    - name: /srv/nginx/www.slcschools.org
    - acl_type: user
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: www_slcschools_org_groupacl

