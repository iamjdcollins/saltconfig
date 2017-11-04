xmlsec1:
  pkg.installed:
    - require:
      - sls: readline
xmlsec1-openssl:
  pkg.installed:
    - require:
      - pkg: xmlsec1
