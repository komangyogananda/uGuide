<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class UserRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'user',
        ]);

        $this->addGet(
            '/((tourist)|(guide))',
            [
                'action' => 'register',
                'tipe' => 1,
            ]
        );

        $this->addPost(
            '/((tourist)|(guide))',
            [
                'action' => 'store',
                'tipe' => 1,
            ]
        );

        $this->addGet(
            '/((tourist)|(guide))/login',
            [
                'tipe' => 1,
                'action' => 'showlogin',
            ]
        );

        $this->addPost(
            '/((tourist)|(guide))/login',
            [
                'tipe' => 1,
                'action' => 'login',
            ]
        );


        $this->addGet(
            '/((tourist)|(guide))/dashboard',
            [
                'tipe' => 1,
                'action' => 'dashboard',
            ]
        );

        $this->addGet(
            '/((tourist)|(guide))/profile',
            [
                'tipe' => 1,
                'action' => 'profile',
            ]
        );

        $this->addGet(
            '/((tourist)|(guide))/active',
            [
                'tipe' => 1,
                'action' => 'active',
            ]
        );

        $this->addGet(
            '/((tourist)|(guide))/history',
            [
                'tipe' => 1,
                'action' => 'history',
            ]
        );

        $this->addGet(
            '/((tourist)|(guide))/find',
            [
                'tipe' => 1,
                'action' => 'find',
            ]
        );


        return $this;
    }
}

?>