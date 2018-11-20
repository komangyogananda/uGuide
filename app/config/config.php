<?php 

    use Phalcon\Config;

    return new Config([

        'database' => [
            'adapter' => 'Phalcon\Db\Adapter\Pdo\Mysql',
            'host' => 'localhost',
            'username' => 'kulguy',
            'password' => 'yoganteng',
            'dbname' => 'uGuide'
        ],
        'url' => [
            'baseUrl' => 'http://localhost/uGuide/'
        ]

    ]);

?>