memcachedgroup:
  group.present:
    - name: memcached
    - gid: 10002
    - system: True
    - addusers:
      - webmaster
      - nginx
    - require:
      - sls: memcached152
memcacheduser:
  user.present:
    - name: memcached
    - uid: 10002
    - gid: 10002
    - createhome: True
    - empty_password: False
    - shell: /bin/bash
    - fullname: 'Memcached System User'
    - groups:
      - memcached
    - require: 
      - group: memcachedgroup
memcachedrundir:
  file.directory:
    - name: /var/run/memcached
    - user: memcached
    - group: memcached 
    - mode: 770
    - makedirs: True
    - require:
      - user: memcacheduser
memcachedconfigdir:
  file.directory:
    - name: /etc/memcached
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - file: memcachedrundir
memcachedconfigfile:
  file.managed:
    - name: /etc/memcached/memcached.conf
    - source: /srv/salt/files/etc/memcached/memcached.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: memcachedconfigdir
memcachedservicefile:
  file.managed:
    - name: /usr/lib/systemd/system/memcached.service
    - source: /srv/salt/files/usr/lib/systemd/system/memcached.service
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: memcachedconfigfile
memcachedselinuxpresent:
  selinux.fcontext_policy_present:
    - name: /var/run/memcached(/.*)?
    - sel_type: memcached_var_run_t
    - require:
      - file: memcachedservicefile
memcachedselinuxapplied:
  selinux.fcontext_policy_applied:
    - name: /var/run/memcached
    - recursive: True
    - require:
      - selinux: memcachedselinuxpresent
memcachedtmpfiles:
  file.managed:
    - name: /usr/lib/tmpfiles.d/memcached.conf
    - source: /srv/salt/files/usr/lib/tmpfiles.d/memcached.conf
    - replace: True
    - require:
      - selinux: memcachedselinuxapplied
memcachedservice:
  service.enabled:
    - name: memcached.service
    - require:
      - file: memcachedtmpfiles
