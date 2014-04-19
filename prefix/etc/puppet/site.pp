package { [
  'build-essential',
  'daemontools',
  'daemontools-run',
  'ntp',
  'perl',
  'offlineimap',
]:
  ensure => latest,
}

cron { puppet:
  command => 'sudo puppet apply ~/prefix/etc/puppet/site.pp',
  user => fsareshwala,
  target => fsareshwala,
  hour => '*',
}

cron { offlineimap:
  command => '/usr/bin/setlock -nx /tmp/offlineimap.lock offlineimap >> /tmp/offlineimap.cron',
  user => fsareshwala,
  target => fsareshwala,
  hour => '*',
}

file { [
  '/etc/service/ntpd',
]:
  ensure => directory,
  require => Package['daemontools'],
}

file { '/etc/service/ntpd/run':
  ensure => present,
  backup => false,
  owner => root,
  group => root,
  mode => 755,
  require => File['/etc/service/ntpd'],
  content => '#!/bin/sh
exec /usr/sbin/ntpd -n -g -u 113:121
'
}

service { 'ntpd':
  require => File['/etc/service/ntpd/run'],
  provider => 'daemontools',
  path => '/etc/service',
  enable => true,
  ensure => running,
  subscribe => [File['/etc/service/ntpd/run'], Package['ntp']],
}
