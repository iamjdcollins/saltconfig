include:
  - reloadsystemd
  - restartpostgresserver

finaldbprodstate:
  test.succeed_without_changes:
    - require:
      - sls: reloadsystemd
      - sls: restartpostgresserver
