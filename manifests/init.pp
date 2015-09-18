# == Class: zabbixagent

# === Authors
#
# Grzegorz Kurkowiak g.kurkowiak@gmail.com
#
# === Copyright
#
# Copyright 2015 Grzegorz Kurkowiak, unless otherwise noted.
#
class zabbixagent (
 	 $zabbix_version = '2.4'


) {

case $::operatingsystemrelease {
      /^14.04/: {
        $majorrelease = '14'
        $ubuntu       = 'trusty'
      }
      /^12.04/: {
        $majorrelease = '12'
        $ubuntu       = 'precise'
      }
      /^10.04/: {
        $majorrelease = '10'
        $ubuntu       = 'lucid'
      }
      /^6.7/: {
        $majorrelease = '6'
      }

      default: {
        fail("This is an unsupported operating system (${::operatingsystem} ${::operatingsystemrelease})")
      }
      } # end of release

case $::operatingsystem {
        'ubuntu': {
		apt::source { 'zabbix':
          	location => "http://repo.zabbix.com/zabbix/${zabbix_version}/ubuntu/",
          	release  => $ubuntu,
          	repos    => 'main',
          	key      => {
            	'id'     => 'FBABD5FB20255ECAB22EE194D13D58E479EA5ED4',
            	'source' => 'http://repo.zabbix.com/zabbix-official-repo.key'
          },
        }
        } # end ubuntu
        'centos','scientific','redhat','oraclelinux','amazon' : {
		yumrepo { 'zabbix':
	        name     => "Zabbix_${majorrelease}_${::architecture}",
          	descr    => "Zabbix_${majorrelease}_${::architecture}",
          	baseurl  => "http://repo.zabbix.com/zabbix/${zabbix_version}/rhel/${majorrelease}/${::architecture}/",
          	gpgcheck => '1',
          	gpgkey   => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
          	priority => '1',
        }
       		yumrepo { 'zabbix-nonsupported':
          	name     => "Zabbix_nonsupported_${majorrelease}_${::architecture}",
          	descr    => "Zabbix_nonsupported_${majorrelease}_${::architecture}",
          	baseurl  => "http://repo.zabbix.com/non-supported/rhel/${majorrelease}/${::architecture}/",
          	gpgcheck => '1',
          	gpgkey   => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
          	priority => '1',
        }
	} # end centos 


} #end operatingsystem case
} #end class
