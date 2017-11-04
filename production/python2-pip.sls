python2-pip:
  pkg.installed:
    - require:
      - sls: nodejs
