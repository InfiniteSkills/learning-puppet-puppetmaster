node /^puppet/ {
  include puppetmaster
}

node /^web/ {

 notify{"PROVISION A DEVELOPMENT  WEBSERVER": }
 notify{"Deploy Web Application Version: ${::app_version}": }
 include webserver

  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
  }

  mcollective::plugin { ['puppet', 'service']:
    package => true,
  }

}
