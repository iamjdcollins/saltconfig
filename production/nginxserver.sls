nginxgroup:
  group.present:
    - name: nginx
    - gid: 10001
    - system: True
    - addusers:
      - webmaster
    - require:
      - sls: nginx1121
nginxuser:
  user.present:
    - name: nginx
    - uid: 10001
    - gid: 10001
    - createhome: True
    - empty_password: False
    - shell: /bin/bash
    - fullname: 'Nginx System User'
    - require: 
      - group: nginxgroup
/srv/nginx:
  file.directory:
    - user: nginx
    - group: nginx
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - makedirs: True
    - require:
      - user: nginxuser
nginx_defaultgroupacl:
  acl.present:
    - name: /srv/nginx
    - acl_type: d:g
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - file: /srv/nginx
nginx_defaultuseracl:
  acl.present:
    - name: /srv/nginx
    - acl_type: d:u
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: nginx_defaultgroupacl
nginx_groupacl:
  acl.present:
    - name: /srv/nginx
    - acl_type: group
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: nginx_defaultuseracl
nginx_useracl:
  acl.present:
    - name: /srv/nginx
    - acl_type: user
    - acl_name: nginx
    - perms: rwx
    - recurse: True
    - require:
      - acl: nginx_groupacl
nginxservicefile:
  file.managed:
    - name: /usr/lib/systemd/system/nginx.service
    - source: /srv/salt/files/nginx/nginx.service
    - user: root
    - group: root
    - mode: 644
    - require:
      - acl: nginx_useracl
nginxselinuxpresent:
  selinux.fcontext_policy_present:
    - name: /srv/nginx(/.*)?
    - sel_type: httpd_sys_content_t
    - require:
      - file: nginxservicefile
nginxselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - selinux: nginxselinuxpresent
nginxconf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: /srv/salt/files/nginx/nginx.conf
    - replace: True
    - require:
      - selinux: nginxselinuxapplied
nginxsiteenabled:
  file.directory:
    - name: /etc/nginx/sites-enabled
    - require:
      - file: nginxconf
nginxservice:
  service.enabled:
    - name: nginx.service
    - require:
      - file: nginxsiteenabled
