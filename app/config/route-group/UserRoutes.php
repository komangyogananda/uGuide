<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class UserRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'user',
        ]);

        $this->addGet(
            '/tourist',
            [
                'action' => 'register',
                'tipe' => 'tourist',
            ]
        );

        $this->addGet(
            '/guide',
            [
                'action' => 'register',
                'tipe' => 'guide',
            ]
        );

        $this->addGet(
            '/login/tourist',
            [
                'action' => 'login',
                'tipe' => 'tourist',
            ]
        );

        $this->addGet(
            '/login/guide',
            [
                'action' => 'login',
                'tipe' => 'guide',
            ]
        );


        return $this;
    }
}

?>