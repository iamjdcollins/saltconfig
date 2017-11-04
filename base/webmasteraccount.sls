webmastergroup:
  group.present:
    - name: webmaster
    - gid: 11000
    - system: True
    - require:
      - sls: sshfirewall
webmasteruser:
  user.present:
    - name: webmaster
    - uid: 11000
    - gid: 11000
    - createhome: True
    - password: {{ salt['cmd.run']("echo 'U2FsdGVkX19szHwgRwnOyV0EtbrQ7AIdCPtZFll1YiI=' | openssl enc -d -kfile /saltsecrets -aes-256-cbc -base64",python_shell=True) }}
    - hash_password: True
    - shell: /bin/bash
    - fullname: 'Webmaster User'
    - groups:
      - wheel
      - webmaster
    - require:
      - group: webmastergroup
