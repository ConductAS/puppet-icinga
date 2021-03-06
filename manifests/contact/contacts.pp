define icinga::contact::contacts($alias = false, $email = false, $group = false) {
	$t_email = $email ? {
		false   => 'root@localhost',
		default => $email,
	}

	nagios_contact { "$name":
		ensure        => present,
		alias         => $alias,
		email         => $t_email,
		contactgroups => $group,
		use           => 'generic-contact',
		target        => '/etc/icinga/objects/contacts.cfg',
	}
}

# vim: tabstop=3