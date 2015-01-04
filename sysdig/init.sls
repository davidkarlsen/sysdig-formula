sysdig-deb-repo:
  pkgrepo.managed:
    - humanname: Sysdig
    - name: deb http://download.draios.com/stable/deb stable-$(ARCH)/
    - file: /etc/apt/sources.list.d/sysdig.list
    - key_url: https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
    - enabled: true
    - require_in:
      - pkg: sysdig
sysdig:
  pkg:
    - installed
