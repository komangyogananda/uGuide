<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class TripRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'trip',
        ]);
       
        $this->addGet(
            '/((tourist)|(guide))/find',
            [
                'tipe' => 1,
                'action' => 'find',
            ]
        );

        $this->addPost(
            '/((tourist)|(guide))/find',
            [
                'tipe' => 1,
                'action' => 'create',
            ]
        );

        return $this;
    }
}

?>