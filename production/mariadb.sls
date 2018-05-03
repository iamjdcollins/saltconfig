mariadb:
  pkg.installed:
    - require:
      - sls: python354
