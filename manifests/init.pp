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
 	 $zabbix_version = $zabbix::parameters::zabbix_version,
	 $serverip = $zabbix::parameters::serverip
	
	)inherits zabbixagent::parameters {
	 class { 'zabbixagent::repository': }
	

} #end class
