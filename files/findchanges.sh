#!/bin/bash
find ./ -type f ! -path './findchanges.sh' ! -path './etc/environment' ! -path './etc/pki/tls/private/star_slcschools_org.key' -exec diff -q {} /{} \;
