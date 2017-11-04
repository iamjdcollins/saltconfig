readline:
  pkg.installed:
    - require:
      - sls: sqlite
readline-devel:
  pkg.installed:
    - require:
      - pkg: readline
