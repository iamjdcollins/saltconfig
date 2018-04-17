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
