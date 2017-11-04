base:
  '*':
    - mindevel
    - setroubleshoot

production:
  '*':
     - mindevel
     - setroubleshoot
     - sshfirewall
     - webmasteraccount
  'webfe*':
    - openssl
    - bzip2
    - ncurses
    - gdbm
    - xz
    - sqlite
    - readline
    - xmlsec1
    - libevent
    - nodejs
    - python2-pip
    - python354
    - pipvirtualenv3
    - postgresql964
    - nginx1121
    - memcached152
    - nginxserver
    - httpfirewall
    - httpsfirewall
    - djangodir
    - gunicornserver
    - memcachedserver
    - www_slcschools_org_gunicorn
    - www_slcschools_org_nginx
    - www_slcschools_org_env_prod
    - www_slcschools_org_app_prod
    - www_slcschools_org_virtualenv_prod
  'webdb*':
    - openssl
    - bzip2
    - ncurses
    - gdbm
    - xz
    - sqlite
    - readline
    - xmlsec1
    - libevent
    - nodejs
    - python2-pip
    - python354
    - pipvirtualenv3
    - postgresql964
    - nginx1121
    - memcached152
    - postgresserver
    - postgresqlfirewall
    - www_slcschools_org_database
    - finaldbprodstate
test:
  '*':
     - mindevel
     - setroubleshoot
     - sshfirewall
     - webmasteraccount
  'webfe*':
    - openssl
    - bzip2
    - ncurses
    - gdbm
    - xz
    - sqlite
    - readline
    - xmlsec1
    - libevent
    - nodejs
    - python2-pip
    - python354
    - pipvirtualenv3
    - postgresql964
    - nginx1121
    - memcached152
    - nginxserver
    - httpfirewall
    - httpsfirewall
    - djangodir
    - gunicornserver
    - postgresserver
    - memcachedserver
    - www_slcschools_org_database
    - www_slcschools_org_gunicorn
    - www_slcschools_org_nginx
    - www_slcschools_org_env_test
    - www_slcschools_org_app_test
    - www_slcschools_org_virtualenv_test
    - finalteststate
development:
  '*':
     - mindevel
     - setroubleshoot
     - sshfirewall
     - webmasteraccount
  'webfe*':
    - openssl
    - bzip2
    - ncurses
    - gdbm
    - xz
    - sqlite
    - readline
    - xmlsec1
    - libevent
    - nodejs
    - python2-pip
    - python354
    - pipvirtualenv3
    - postgresql964
    - nginx1121
    - memcached152
    - nginxserver
    - httpfirewall
    - httpsfirewall
    - djangodir
    - gunicornserver
    - postgresserver
    - memcachedserver
    - www_slcschools_org_database
    - www_slcschools_org_gunicorn
    - www_slcschools_org_nginx
    - www_slcschools_org_env_dev
    - www_slcschools_org_app_dev
    - www_slcschools_org_virtualenv_dev
    - finaldevstate
