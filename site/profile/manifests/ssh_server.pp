class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCrtFwvP9KCdPFEInOcfYJN9mHi/FQMFrgXsCGi582pvZ3Z+2LDQHC62NSVtAC6oh89R9D3Gn/GGjaNVMX0It+LOT2HiFMH6AATcgf7OLYFeRxYEZa60Wy2pzvV/ENWa9e6Mpvf0ti47cpPGavDCVYXfyB/c28c1fmp9AnPbbabwmiKgiL4fKFIXLtySFmZ8w69pU5ZyNYqTN9WXcqNFGmcSsiTbhZsCvdlH9I8Ha6uQh1uV49T5ZlrjynR1wEzLmqT2DtxIKZMFGop3+X/yM8Y7nismOTPJl7skO2/vNK/DA7aHrfciotuqCds5+2Kvt5vn96lX+WpYRJ7/N6GK3nx',
  }
}
