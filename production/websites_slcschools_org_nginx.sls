include:
  - slcschools_org_cert

websites_slcschools_org_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/websites.slcschools.org.conf
    - source: /etc/nginx/sites-enabled/websites.slcschools.org.conf
    - replace: True
    - require:
      - sls: www_slcschools_org_gunicorn
      - sls: slcschools_org_cert
websites_slcschools_org_dir:
  file.directory:
    - name: /srv/nginx/websites.slcschools.org
    - user: nginx
    - group: nginx 
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: websites_slcschools_org_conf
websites_slcschools_org_nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - file: websites_slcschools_org_dir
websites_slcschools_org_defaultgroupacl:
  acl.present:
    - name: /srv/nginx/websites.slcschools.org
    - acl_type: d:g
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - selinux: websites_slcschools_org_nginxselinuxapplied
websites_slcschools_org_defaultuseracl:
  acl.present:
    - name: /srv/nginx/websites.slcschools.org
    - acl_type: d:u
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: websites_slcschools_org_defaultgroupacl
websites_slcschools_org_groupacl:
  acl.present:
    - name: /srv/nginx/websites.slcschools.org
    - acl_type: group
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: websites_slcschools_org_defaultuseracl
websites_slcschools_org_useracl:
  acl.present:
    - name: /srv/nginx/websites.slcschools.org
    - acl_type: user
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: websites_slcschools_org_groupacl
