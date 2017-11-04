restartwww_slcschools_org_gunicorn:
  module.run:
    - name: service.restart
    - m_name: gunicorn_www_slcschools_org.service
