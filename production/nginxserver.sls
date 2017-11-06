nginxgroup:
  group.present:
    - name: nginx
    - gid: 10001
    - system: True
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
    - mode: 755
    - makedirs: True
    - require:
      - user: nginxuser
nginxservicefile:
  file.managed:
    - name: /usr/lib/systemd/system/nginx.service
    - source: /srv/salt/files/nginx/nginx.service
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /srv/nginx
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
