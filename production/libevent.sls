libevent:
  pkg.installed:
    - require:
      - sls: xmlsec1
libevent-devel:
  pkg.installed:
    - require:
      - pkg: libevent
