node /^puppet/ {
  include puppetmaster
}

node /^web/ {

 notify{"PROVISION A PRODUCTION WEBSERVER": }
 include webserver

  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
  }

  mcollective::plugin { ['puppet', 'service']:
    package => true,
  }

}
