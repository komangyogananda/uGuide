<?php

    use Phalcon\DI\FactoryDefault;
    use Phalcon\Mvc\Model\Manager;
    use Phalcon\Flash\Direct as FlashDirect;
    use Phalcon\Flash\Session as FlashSession;
    use Phalcon\Http\Response\Cookies;

    $di->set(
        'cookies',
        function () {
            $cookies = new Cookies();

            $cookies->useEncryption(false);

            return $cookies;
        }
    );

    $di->set(
        'flash',
        function () {
            return new FlashDirect();
        }
    );

    $di->set(
        'flashSession',
        function () {
            return new FlashSession([
                'error' => 'ui negative message center aligned five column wide row',
                'success' => 'ui positive message center aligned row'
            ]);
        }
    );

    $di->set(
        'voltService',
        function($view, $di){
            $volt = new Phalcon\Mvc\View\Engine\Volt($view, $di);
            
            $volt->setOptions([
                'compiledPath' => APP_PATH.'/cache/',
                'compiledExtension' => '.uGuideVolt',
                'compileAlways' => true,
            ]);

            $compiler = $volt->getCompiler();
            $compiler->addFunction('strtotime', 'strtotime');

            return $volt;
        }
    );

    $di->set(
        'view',
        function(){
            $view = new Phalcon\Mvc\View();
            $view->setViewsDir(APP_PATH.'/views/');
            $view->registerEngines([
                ".volt" => 'voltService',
            ]);

            return $view;
        }
    );

    $di->set(
        'db',
        function() use ($config){
            $dbAdapter = $config->database->adapter;
            
            return new $dbAdapter([
                'host' => $config->database->host,
                'username' => $config->database->username,
                'password' => $config->database->password,
                'dbname' => $config->database->dbname,
                'port' => $config->database->port,
                'options' => [PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC],
            ]);
        }
    );

    $di->set(
        'url',
        function() use ($config, $di){
            $url = new Phalcon\Mvc\Url();

            $url->setBaseUri($config->path('url.baseUrl'));

            return $url;
        }
    );

    $di->set(
        'transactions',
        function(){
            return new \Phalcon\Mvc\Model\Transaction\Manager();
        }
    );
    
    $di->set(
        'modelsManager',
        function(){
            return new \Phalcon\Mvc\Model\Manager();
        }
    );
    
    $di->set(
        'session',
        function () {
            $session = new Phalcon\Session\Adapter\Files();
            $session->start();
    
            return $session;
        }
    );
    $di->set(
        'cookies',
        function () {
            $cookies = new Phalcon\Http\Response\Cookies();
            $cookies->useEncryption(false);
    
            return $cookies;
        }
    );

?>