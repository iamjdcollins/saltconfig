ncurses:
  pkg.installed:
    - require:
      - sls: bzip2
ncurses-devel:
  pkg.installed:
    - require:
      - pkg: ncurses
