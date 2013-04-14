define freeradius::vhost (
  $authorize_preprocess           = $freeradius::params::vhost['authorize']['preprocess'],
  $authorize_auth_log             = $freeradius::params::vhost['authorize']['auth_log'],
  $authorize_chap                 = $freeradius::params::vhost['authorize']['chap'],
  $authorize_mschap               = $freeradius::params::vhost['authorize']['mschap'],
  $authorize_digest               = $freeradius::params::vhost['authorize']['digest'],
  $authorize_wimax                = $freeradius::params::vhost['authorize']['wimax'],
  $authorize_ipass                = $freeradius::params::vhost['authorize']['ipass'],
  $authorize_suffix               = $freeradius::params::vhost['authorize']['suffix'],
  $authorize_proxy                = $freeradius::params::vhost['authorize']['proxy'],
  $authorize_ntdomain             = $freeradius::params::vhost['authorize']['ntdomain'],
  $authorize_eap                  = $freeradius::params::vhost['authorize']['eap'],
  $authorize_unix                 = $freeradius::params::vhost['authorize']['unix'],
  $authorize_files                = $freeradius::params::vhost['authorize']['files'],
  $authorize_sql                  = $freeradius::params::vhost['authorize']['sql'],
  $authorize_smbpasswd            = $freeradius::params::vhost['authorize']['smbpasswd'],
  $authorize_ldap                 = $freeradius::params::vhost['authorize']['ldap'],
  $authorize_daily                = $freeradius::params::vhost['authorize']['daily'],
  $authorize_checkval             = $freeradius::params::vhost['authorize']['checkval'],
  $authorize_expiration           = $freeradius::params::vhost['authorize']['expiration'],
  $authorize_logintime            = $freeradius::params::vhost['authorize']['logintime'],
  $authorize_pap                  = $freeradius::params::vhost['authorize']['pap'],
  $authorize_extra                = undef,
  $authentication_pap             = $freeradius::params::vhost['authentication']['pap'],
  $authentication_chap            = $freeradius::params::vhost['authentication']['chap'],
  $authentication_mschap          = $freeradius::params::vhost['authentication']['mschap'],
  $authentication_digest          = $freeradius::params::vhost['authentication']['digest'],
  $authentication_pam             = $freeradius::params::vhost['authentication']['pam'],
  $authentication_unix            = $freeradius::params::vhost['authentication']['unix'],
  $authentication_ldap            = $freeradius::params::vhost['authentication']['ldap'],
  $authentication_eap             = $freeradius::params::vhost['authentication']['eap'],
  $authentication_extra           = undef,
  $preacct_preprocess             = $freeradius::params::vhost['preacct']['preprocess'],
  $preacct_acct_unique            = $freeradius::params::vhost['preacct']['acct_unique'],
  $preacct_ipass                  = $freeradius::params::vhost['preacct']['ipass'],
  $preacct_suffix                 = $freeradius::params::vhost['preacct']['suffix'],
  $preacct_ntdomain               = $freeradius::params::vhost['preacct']['ntdomain'],
  $preacct_files                  = $freeradius::params::vhost['preacct']['files'],
  $preacct_extra                  = undef,
  $accounting_detail              = $freeradius::params::vhost['accounting']['detail'],
  $accounting_daily               = $freeradius::params::vhost['accounting']['daily'],
  $accounting_unix                = $freeradius::params::vhost['accounting']['unix'],
  $accounting_radutmp             = $freeradius::params::vhost['accounting']['radutmp'],
  $accounting_sradutmp            = $freeradius::params::vhost['accounting']['sradutmp'],
  $accounting_main_pool           = $freeradius::params::vhost['accounting']['main_pool'],
  $accounting_sql                 = $freeradius::params::vhost['accounting']['sql'],
  $accounting_ignore_zero_session = $freeradius::params::vhost['accounting']['ignore_zero_session'],
  $accounting_sql_log             = $freeradius::params::vhost['accounting']['sql_log'],
  $accounting_pgsql_voip          = $freeradius::params::vhost['accounting']['pgsql_voip'],
  $accounting_exec                = $freeradius::params::vhost['accounting']['exec'],
  $accounting_extra               = undef,
  $session_radutmp                = $freeradius::params::vhost['session']['radutmp'],
  $session_sql                    = $freeradius::params::vhost['session']['sql'],
  $postauth_main_pool             = $freeradius::params::vhost['postauth']['main_pool'],
  $postauth_reply_log             = $freeradius::params::vhost['postauth']['reply_log'],
  $postauth_sql                   = $freeradius::params::vhost['postauth']['sql'],
  $postauth_sql_log               = $freeradius::params::vhost['postauth']['sql_log'],
  $postauth_ldap                  = $freeradius::params::vhost['postauth']['ldap'],
  $postauth_exec                  = $freeradius::params::vhost['postauth']['exec'],
  $postauth_wimax                 = $freeradius::params::vhost['postauth']['wimax'],
  $postauth_reject                = $freeradius::params::vhost['postauth']['reject'],
  $postauth_extra                 = undef,
  $preproxy_attr_rewrite          = $freeradius::params::vhost['preproxy']['attr_rewrite'],
  $preproxy_files                 = $freeradius::params::vhost['preproxy']['files'],
  $preproxy_pre_proxy_log         = $freeradius::params::vhost['preproxy']['pre_proxy_log'],
  $preproxy_extra                 = undef,
  $postproxy_post_proxy_log       = $freeradius::params::vhost['postproxy']['post_proxy_log'],
  $postproxy_attr_rewrite         = $freeradius::params::vhost['postproxy']['attr_rewrite'],
  $postproxy_eap                  = $freeradius::params::vhost['postproxy']['eap'],
  $postproxy_extra                = undef
) {
  File {
     owner => 'root',
     group => 'root',
     mode  => '0644',
  }

  file { "${freeradius::params::radius['vhost_dir']}/${name}":
    ensure  => file,
    content => template('freeradius/common/vhost.conf.erb'),
  }
}
