node /^puppet/ {
  include puppetmaster
}

node /^web/ {
 include webserver

  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
  }

  mcollective::plugin { ['puppet', 'service']:
    package => true,
  }

}