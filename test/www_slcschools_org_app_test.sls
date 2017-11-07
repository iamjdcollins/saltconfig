www_slcschools_org_app_test:
  git.latest:
    - name: https://github.com/iamjdcollins/districtwebsite.git
    - target: /srv/django/www_slcschools_org
    - user: webmaster
    - rev: testing
    - branch: testing
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - require:
      - sls: www_slcschools_org_env_test
