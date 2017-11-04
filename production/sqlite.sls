sqlite:
  pkg.installed:
    - require:
      - sls: xz
sqlite-devel:
  pkg.installed:
    - require:
      - pkg: sqlite
