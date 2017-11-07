www_slcschools_org_app_prod:
  git.latest:
    - name: https://github.com/iamjdcollins/districtwebsite.git
    - target: /srv/django/www_slcschools_org
    - user: webmaster
    - rev: master
    - branch: master
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - require:
      - sls: www_slcschools_org_env_prod
