<?php 

    use Phalcon\Config;

    return new Config([

        'database' => [
            'adapter' => 'Phalcon\Db\Adapter\Pdo\Mysql',
            'host' => 'localhost',
            // 'username' => 'root',
            // 'password' => '',
            // 'dbname' => 'uguide'
            'username' => 'user-pweb',
            'password' => 'user-pweb1718',
            'dbname' => 'pweb_f_11'
        ],
        'url' => [
            // 'baseUrl' => 'http://localhost/uGuide/'
            'baseUrl' => 'http://10.151.62.127/FP_PWEB_F/FP_PWEB_F/11/uGuide/'
        ]

    ]);

?>