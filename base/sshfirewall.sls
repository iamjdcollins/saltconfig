developmentfirewall:
  firewalld.present:
    - name: public
    - services:
      - ssh
    - require:
      - sls: setroubleshoot
