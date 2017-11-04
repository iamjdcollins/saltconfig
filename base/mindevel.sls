saltsecrets:
  module.run:
    - name: file.check_hash
    - path: /saltsecrets
    - file_hash: sha512=e995f87bfb78817cac18231501eca6c2662289dfbdf3d7d96b83c1c6a34ebad1d953147dff50f972dcc52d8743d0884d72c0fae0350376381f5e65d6bc3ad85d
    - failhard: True
Minimal Install:
  pkg.group_installed:
   - require:
     - module: saltsecrets
Development Tools:
  pkg.group_installed:
    - require: 
      - pkg: 'Minimal Install'
