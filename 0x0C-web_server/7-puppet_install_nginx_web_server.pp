# configures nginx server and do some basic setups
exec { 'install nginx server':
    command => 'sudo apt-get -y install nginx',
}

file { 'index.html':
    ensure  => file,
    content => 'Hello World!',
    mode    => '0744',
}
file { 'redirect_me':
    ensure  => file,
    content => 'Redirection',
    mode    => '0744',
}

exec { 'move the index.html and redirect_me to /var/www/html/':
    command => ['sudo mv index.html /var/www/html/',
    'sudo mv redirect_me /var/www/html/',
    'sudo ufw allow "Nginx HTTP"',
    'sudo cp /etc/nginx/sites-available/default ./',
    ],
}

exec { 'adjust the server block and update':
    command => ['sudo sed -i "
    /:80 default_server;/a\
    rewrite ^/redirect_me shafam.tech permanent;" default',
    'sudo mv default /etc/nginx/sites_available/',
    ]
}

exec { 'restart the nginx server':
    command => 'sudo system nginx restart',
}
