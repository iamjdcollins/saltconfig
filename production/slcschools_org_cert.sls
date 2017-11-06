slcschoolscrt:
  file.managed:
    - name: /etc/pki/tls/certs/star_slcschools_org.crt
    - source: /srv/salt/files/nginx/star_slcschools_org.crt
    - replace: True
    - require:
      - sls: nginxserver
slcschoolskeytemplate:
  file.managed:
    - name: /etc/pki/tls/private/star_slcschools_org.key
    - source: /srv/salt/files/nginx/star_slcschools_org.key
    - replace: False
slcschoolskeycontents:
  file.blockreplace:
    - name: /etc/pki/tls/private/star_slcschools_org.key
    - marker_start: '-----BEGIN RSA PRIVATE KEY-----'
    - marker_end: '-----END RSA PRIVATE KEY-----'
    - append_if_not_found: True
    - content: |
{{ salt['cmd.run']("echo -e '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' | openssl enc -d -k \"$SALTSECRETS\" -aes-256-cbc -base64 | sed 's|^|        |g'",python_shell=True) }}
digicertchain:
  file.managed:
    - name: /etc/pki/ca-trust/source/anchors/DigiCertCA.crt
    - source: /srv/salt/files/nginx/DigiCertCA.crt
    - replace: True
