virtualenv3:
  pip.installed:
    - name: virtualenv
    - bin_env: '/usr/bin/pip3.5'
    - require:
      - sls: python354
virtualenvs:
  file.directory:
    - name: /srv/virtualenv
    - require:
      - pip: virtualenv3
