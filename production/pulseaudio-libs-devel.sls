pulseaudio-libs-devel:
  pkg.installed:
    - require:
      - sls: ghostscript-devel
