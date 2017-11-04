postgresqlfirewall:
  firewalld.present:
    - name: public
    - services:
      - postgresql
    - prune_services: False
