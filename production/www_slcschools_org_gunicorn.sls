www_slcschools_org_gunicorn_service:
  file.managed:
    - name: /usr/lib/systemd/system/gunicorn_www_slcschools_org.service
    - source: /srv/salt/files/usr/lib/systemd/system/gunicorn_www_slcschools_org.service
    - replace: True
    - require:
      - sls: gunicornserver
gunicorn_www_slcschools_org_serviecs:
  service.enabled:
    - name: gunicorn_www_slcschools_org.service
    - require:
      - file: www_slcschools_org_gunicorn_service
