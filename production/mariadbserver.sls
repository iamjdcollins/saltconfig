mariadb-server:
  pkg.installed:
    - require:
      - sls: mariadb
mariadbmycnf:
  file.managed:
    - name: /etc/my.cnf
    - source: /srv/salt/files/mariadb/my.cnf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mariadb-server
/srv/mariadb:
  file.directory:
    - user: mysql
    - group: mysql
    - mode: 755
    - makedirs: True
    - require:
      - file: mariadbmycnf
mariadbservice:
  service.enabled:
    - name: mariadb.service
    - require:
      - file: /srv/mariadb
mariadbbasepresent:
  selinux.fcontext_policy_present:
    - name: /srv/mariadb(/.*)?
    - sel_type: mysqld_db_t
    - require:
      - service: mariadbservice
mariadbbaseapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - selinux: mariadbbasepresent
