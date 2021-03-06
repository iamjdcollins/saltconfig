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
     - environment
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
    - cmake3
    - freetype-devel
    - fontconfig-devel
    - openjpeg2-devel
    - libjpeg-turbo-devel
    - libpng-devel
    - libtiff-devel
    - ghostscript-devel
    - pulseaudio-libs-devel
    - tesseract
    - sox-devel
    - nodejs
    - yuglify
    - python2-pip
    - python354
    - php
    - mariadb
    - revslider
    - antiword037
    - poppler0620
    - popplerdata048
    - pstotext19
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
    - websites_slcschools_org_nginx
    - backman_slcschools_org_nginx
    - beaconheights_slcschools_org_nginx
    - bennion_slcschools_org_nginx
    - bonneville_slcschools_org_nginx
    - bryant_slcschools_org_nginx
    - clayton_slcschools_org_nginx
    - dilworth_slcschools_org_nginx
    - east_slcschools_org_nginx
    - edison_slcschools_org_nginx
    - emerson_slcschools_org_nginx
    - ensign_slcschools_org_nginx
    - escalante_slcschools_org_nginx
    - franklin_slcschools_org_nginx
    - glendale_slcschools_org_nginx
    - hawthorne_slcschools_org_nginx
    - highlandpark_slcschools_org_nginx
    - highland_slcschools_org_nginx
    - hillside_slcschools_org_nginx
    - horizonte_slcschools_org_nginx
    - indianhills_slcschools_org_nginx
    - innovations_slcschools_org_nginx
    - marywjackson_slcschools_org_nginx
    - liberty_slcschools_org_nginx
    - meadowlark_slcschools_org_nginx
    - mountainview_slcschools_org_nginx
    - newman_slcschools_org_nginx
    - nibleypark_slcschools_org_nginx
    - northstar_slcschools_org_nginx
    - northwest_slcschools_org_nginx
    - parkview_slcschools_org_nginx
    - riley_slcschools_org_nginx
    - rosepark_slcschools_org_nginx
    - uintah_slcschools_org_nginx
    - wasatch_slcschools_org_nginx
    - washington_slcschools_org_nginx
    - west_slcschools_org_nginx
    - whittier_slcschools_org_nginx
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
    - yuglify
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
     - environment
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
    - cmake3
    - freetype-devel
    - fontconfig-devel
    - openjpeg2-devel
    - libjpeg-turbo-devel
    - libpng-devel
    - libtiff-devel
    - ghostscript-devel
    - pulseaudio-libs-devel
    - tesseract
    - sox-devel
    - nodejs
    - yuglify
    - python2-pip
    - python354
    - php
    - mariadb
    - mariadbserver
    - revslider
    - antiword037
    - poppler0620
    - popplerdata048
    - pstotext19
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
    - websites_slcschools_org_nginx
    - backman_slcschools_org_nginx
    - beaconheights_slcschools_org_nginx
    - bennion_slcschools_org_nginx
    - bonneville_slcschools_org_nginx
    - bryant_slcschools_org_nginx
    - clayton_slcschools_org_nginx
    - dilworth_slcschools_org_nginx
    - east_slcschools_org_nginx
    - edison_slcschools_org_nginx
    - emerson_slcschools_org_nginx
    - ensign_slcschools_org_nginx
    - escalante_slcschools_org_nginx
    - franklin_slcschools_org_nginx
    - glendale_slcschools_org_nginx
    - hawthorne_slcschools_org_nginx
    - highlandpark_slcschools_org_nginx
    - highland_slcschools_org_nginx
    - hillside_slcschools_org_nginx
    - horizonte_slcschools_org_nginx
    - indianhills_slcschools_org_nginx
    - innovations_slcschools_org_nginx
    - marywjackson_slcschools_org_nginx
    - liberty_slcschools_org_nginx
    - meadowlark_slcschools_org_nginx
    - mountainview_slcschools_org_nginx
    - newman_slcschools_org_nginx
    - nibleypark_slcschools_org_nginx
    - northstar_slcschools_org_nginx
    - northwest_slcschools_org_nginx
    - parkview_slcschools_org_nginx
    - riley_slcschools_org_nginx
    - rosepark_slcschools_org_nginx
    - uintah_slcschools_org_nginx
    - wasatch_slcschools_org_nginx
    - washington_slcschools_org_nginx
    - west_slcschools_org_nginx
    - whittier_slcschools_org_nginx
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
     - environment
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
    - cmake3
    - freetype-devel
    - fontconfig-devel
    - openjpeg2-devel
    - libjpeg-turbo-devel
    - libpng-devel
    - libtiff-devel
    - ghostscript-devel
    - pulseaudio-libs-devel
    - tesseract
    - sox-devel
    - nodejs
    - yuglify
    - python2-pip
    - python354
    - php
    - mariadb
    - mariadbserver
    - revslider
    - antiword037
    - poppler0620
    - popplerdata048
    - pstotext19
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
    - websites_slcschools_org_nginx
    - backman_slcschools_org_nginx
    - beaconheights_slcschools_org_nginx
    - bennion_slcschools_org_nginx
    - bonneville_slcschools_org_nginx
    - bryant_slcschools_org_nginx
    - clayton_slcschools_org_nginx
    - dilworth_slcschools_org_nginx
    - east_slcschools_org_nginx
    - edison_slcschools_org_nginx
    - emerson_slcschools_org_nginx
    - ensign_slcschools_org_nginx
    - escalante_slcschools_org_nginx
    - franklin_slcschools_org_nginx
    - glendale_slcschools_org_nginx
    - hawthorne_slcschools_org_nginx
    - highlandpark_slcschools_org_nginx
    - highland_slcschools_org_nginx
    - hillside_slcschools_org_nginx
    - horizonte_slcschools_org_nginx
    - indianhills_slcschools_org_nginx
    - innovations_slcschools_org_nginx
    - marywjackson_slcschools_org_nginx
    - liberty_slcschools_org_nginx
    - meadowlark_slcschools_org_nginx
    - mountainview_slcschools_org_nginx
    - newman_slcschools_org_nginx
    - nibleypark_slcschools_org_nginx
    - northstar_slcschools_org_nginx
    - northwest_slcschools_org_nginx
    - parkview_slcschools_org_nginx
    - riley_slcschools_org_nginx
    - rosepark_slcschools_org_nginx
    - uintah_slcschools_org_nginx
    - wasatch_slcschools_org_nginx
    - washington_slcschools_org_nginx
    - west_slcschools_org_nginx
    - whittier_slcschools_org_nginx
    - www_slcschools_org_nginx
    - www_slcschools_org_env_dev
    - www_slcschools_org_app_dev
    - www_slcschools_org_virtualenv_dev
    - finaldevstate
