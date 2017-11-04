xz:
  pkg.installed:
    - require:
      - sls: gdbm
xz-devel:
  pkg.installed:
    - require:
      - pkg: xz
