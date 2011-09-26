
class php::params {

	$sapi_apache_packages = ['libapache2-mod-php5']
	$sapi_apache_config = "/etc/php5/apache2/php.ini"
	$sapi_apache_config_d = "/etc/php5/apache2/conf.d"

	$sapi_cli_packages = ['php5-cli']
	$sapi_cli_config = "/etc/php5/cli/php.ini"
	$sapi_cli_config_d = "/etc/php5/cli/conf.d"

	$sapi_cgi_packages = ['php5-cgi'] 
	$sapi_cgi_config = "/etc/php5/cgi/php.ini"
	$sapi_cgi_config_d = "/etc/php5/cgi/conf.d"

}
