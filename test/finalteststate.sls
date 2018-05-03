include:
  - reloadsystemd
  - restartpostgresserver
  - restartmemcachedserver
  - restartnginxserver
  - restartwww_slcschools_org_gunicorn
  - restartphpfpm
  - restartmariadb

finaldevstate:
  test.succeed_without_changes:
    - require:
      - sls: reloadsystemd
      - sls: restartpostgresserver
      - sls: restartmemcachedserver
      - sls: restartnginxserver
      - sls: restartwww_slcschools_org_gunicorn
      - sls: restartphpfpm
      - sls: restartmariadb
