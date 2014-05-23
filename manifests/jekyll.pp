# == Class: jekyll::jekyll
#
# Goes into manifests/jekyll.pp

class jekyll::jekyll {
	# resources
	package { "rubygems":
		ensure => present,
	}
	package { "ruby1.9.1-dev":
		ensure => present,
	}
	package { "ruby1.8-dev":
		ensure => present,
	}
	package {'jekyll':
		ensure     => '1.2.1',
		provider   => 'gem',
		require    => Package['rubygems', 'ruby1.8-dev', 'ruby1.9.1-dev', 'build-essential'],
	}
	package { "activesupport":
		ensure   => '3.1.0',
		provider => 'gem',
		require  => Package['jekyll'],
	}
	package { "kramdown":
		ensure   => present,
		provider => 'gem',
		require  => Package['jekyll'],
	}
	package { "i18n":
		ensure   =>  present,
		provider => 'gem',
	}
	package { "thor":
		ensure   => present,
		provider => 'gem',
		require  => Package['activesupport', 'i18n']
	}
}