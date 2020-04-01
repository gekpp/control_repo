class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
  $install_dir = '/opt/minecraft'
){
  file_line { 'workaround-puppet-agent-6-14-ssl-issue':
      ensure => present,
      path   => "${facts['rubysitedir']}/../../vendor_ruby/puppet/type/file/source.rb",
      line   => '      client.get(url, include_system_store: true) do |response|',
      match  => '^      client.get\(url\) do \|response\|',
      before => File["${install_dir}/minecraft_server.jar"],
  }
  file { "${install_dir}":
    ensure => directory,
  }
  file { "${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']]
  }
}
