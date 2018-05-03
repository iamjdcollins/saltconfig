php:
  pkg.installed:
    - require:
      - sls: python354
php-mysql:
  pkg.installed:
    - require:
      - pkg: php
php-gd:
  pkg.installed:
    - require:
      - pkg: php-mysql
php-fpm:
  pkg.installed:
    - require:
      - pkg: php-gd
phpini:
  file.managed:
    - name: /etc/php.ini
    - source: /srv/salt/files/php/php.ini
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: php-fpm
phpfpmwwwconf:
  file.managed:
    - name: /etc/php-fpm.d/www.conf
    - source: /srv/salt/files/php/www.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: php-fpm
phpfpmservice:
  service.enabled:
    - name: php-fpm.service
    - require:
      - file: phpfpmwwwconf
