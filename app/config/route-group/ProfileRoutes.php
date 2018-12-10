<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class ProfileRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'profile',
        ]);

        $this->addGet(
            '/((tourist)|(guide))/profile/edit',
            [
                'action' => 'editProfile',
                'tipe' => 1,
            ]
        );


        return $this;
    }
}

?>