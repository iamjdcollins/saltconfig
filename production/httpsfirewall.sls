httpsfirewall:
  firewalld.present:
    - name: public
    - services:
      - https
    - prune_services: False
    - require:
      - sls: nginxserver
