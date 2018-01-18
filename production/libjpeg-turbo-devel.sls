libjpeg-turbo-devel:
  pkg.installed:
    - require:
      - sls: openjpeg2-devel
