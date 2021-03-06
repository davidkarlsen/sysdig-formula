{% if grains['os_family'] == 'Debian' %}
deb_repo:
  pkgrepo.managed:
    - humanname: Sysdig
    - name: deb http://download.draios.com/stable/deb stable-$(ARCH)/
    - file: /etc/apt/sources.list.d/sysdig.list
    - key_url: https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
    - enabled: true
    - require_in:
      - pkg: sysdig
{% elif grains['os_family'] == 'RedHat' %}
rhel_repo:
  pkgrepo.managed:
    - humanname: Sysdig
    - name: Sysdig
    - baseurl: http://download.draios.com/stable/rpm/$basearch
    - gpgcheck: 1
    - gpgkey: https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
    - require_in:
      - pkg: sysdig
{% endif %}
sysdig:
  pkg:
    - installed
