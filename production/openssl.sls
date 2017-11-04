openssl:
  pkg.installed:
    - require:
       - sls: webmasteraccount
openssl-devel:
  pkg.installed:
    - require:
      - pkg: openssl
