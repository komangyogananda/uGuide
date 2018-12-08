<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class TouristRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'user',
            'tipe' => 'tourist',
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

        $this->addGet(
            '/dashboard/tourist',
            [
                'action' => 'dashboard',
                'tipe' => 'tourist',
            ]
        );

        $this->addGet(
            '/dashboard/guide',
            [
                'action' => 'dashboard',
                'tipe' => 'guide',
            ]
        );


        return $this;
    }
}

?>