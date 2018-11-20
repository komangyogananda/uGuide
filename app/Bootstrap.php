<?php 

use Phalcon\Mvc\Application;

class Bootstrap extends Application
{
    private function _registerServices()
    {
        $di = new \Phalcon\DI\FactoryDefault();
        $config = require APP_PATH.'/config/config.php';

        include_once APP_PATH.'/config/loader.php';
        include_once APP_PATH.'/config/services.php';
        include_once APP_PATH.'/config/routing.php';

        $this->setDI($di);
    }

    public function init(){
        $debug = new \Phalcon\Debug();
        $debug->listen();

        $this->_registerServices();

        echo $this->handle()->getContent();
    }
}

?>