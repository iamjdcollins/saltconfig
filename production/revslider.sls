revsliderbasepresent:
  selinux.fcontext_policy_present:
    - name: /srv/nginx/revslider(/.*)?
    - sel_type: httpd_sys_rw_content_t
    - require:
      - sls: php
revsliderbaseapplied:
  selinux.fcontext_policy_applied:
    - name: /srv/
    - recursive: True
    - require:
      - selinux: revsliderbasepresent
