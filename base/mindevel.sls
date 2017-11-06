Minimal Install:
  pkg.group_installed
Development Tools:
  pkg.group_installed:
    - require: 
      - pkg: 'Minimal Install'
