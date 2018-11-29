<?php

    $loader = new \Phalcon\Loader();

    $loader->registerDirs([
        APP_PATH.'/controllers/',
        APP_PATH.'/models/',
        APP_PATH.'/config/route-group/',
        APP_PATH.'/forms/'
    ]);

    $loader->register();

?>