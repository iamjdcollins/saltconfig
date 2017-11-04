httpfirewall:
  firewalld.present:
    - name: public
    - services:
      - http
    - prune_services: False
    - require:
      - sls: nginxserver
