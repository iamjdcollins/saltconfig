restartmemcachedserver:
  module.run:
    - name: service.restart
    - m_name: memcached.service 
