include:
  - reloadsystemd
  - restartmemcachedserver
  - restartnginxserver
  - restartwww_slcschools_org_gunicorn

finalwebprodstate:
  test.succeed_without_changes:
    - require:
      - sls: reloadsystemd
      - sls: restartmemcachedserver
      - sls: restartnginxserver
      - sls: restartwww_slcschools_org_gunicorn 
