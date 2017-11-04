bzip2:
  pkg.installed:
    - require:
      - sls: openssl
bzip2-devel:
  pkg.installed:
    - require:
      - pkg: bzip2
