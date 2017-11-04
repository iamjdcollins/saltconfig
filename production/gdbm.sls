gdbm:
  pkg.installed:
    - require:
      - sls: ncurses
gdbm-devel:
  pkg.installed:
    - require:
      - pkg: gdbm
