include:
  - www_slcschools_org_virtualenv_clear

www_slcschools_org_virtualenv_prod:
  virtualenv.managed:
    - name: /srv/virtualenv/www_slcschools_org
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python3.5
    - requirements: /srv/django/www_slcschools_org/requirements/production.txt
    - require:
      - sls: www_slcschools_org_app_prod
      - sls: www_slcschools_org_virtualenv_clear
