node "appserver" {


exec { "apt-get update":
command => "/usr/bin/apt-get update",
}

package { "curl":ensure => present,
require => Exec["apt-get update"],
}

package { "node":ensure => present,
require => Exec["install script"],
}


exec { "install script":
    command => "/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -",
    require => Exec["apt-get update"], 
}


}


node "webserver" {

exec { "apt-get update":
command => "/usr/bin/apt-get update",
}

package { "nginx":ensure => present,
require => Exec["apt-get update"],
}


}
