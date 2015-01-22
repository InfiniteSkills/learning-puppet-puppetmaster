node /^puppet/ {
  include puppetmaster
}

node /^web/ {

 notify{"PROVISION A DEVELOPMENT  WEBSERVER": }
 include webserver

  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
  }

  mcollective::plugin { ['puppet', 'service']:
    package => true,
  }

}
