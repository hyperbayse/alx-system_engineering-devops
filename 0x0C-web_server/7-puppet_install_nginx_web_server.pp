# configures nginx server and do some basic setups
package { 'nginx':
    ensure => installed,
}

file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    mode    => '0644',
}
file { '/var/www/html/redirect_me':
    ensure  => file,
    content => 'Redirection',
    mode    => '0644',
}

exec { 'listen on 80':
    command => ['sudo ufw allow "Nginx HTTP"',
    'sudo cp /etc/nginx/sites-available/default ./',
    ],
    path    => ['/bin', '/usr/bin'],
}

exec { 'adjust the server block and update':
    command => ['sudo sed -i "
    /:80 default_server;/a\
    rewrite ^/redirect_me shafam.tech permanent;" default',
    'sudo mv default /etc/nginx/sites_available/',
    ]
    path    => ['/bin', '/usr/bin'],
}

exec { 'restart the nginx server':
    command => 'sudo system nginx restart',
    path    => ['/bin', '/usr/bin'],
}
