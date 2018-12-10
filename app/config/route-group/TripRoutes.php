<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class TripRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'trip',
        ]);
       
        $this->addGet(
            '/tourist/find',
            [
                'tipe' => 'tourist',
                'action' => 'findTourist',
            ]
        );

        $this->addPost(
            '/tourist/find',
            [
                'tipe' => 'tourist',
                'action' => 'createTourist',
            ]
        );

        $this->addGet(
            '/guide/find',
            [
                'tipe' => 'guide',
                'action' => 'findGuide',
            ]
        );

        $this->addPost(
            '/guide/find',
            [
                'tipe' => 'guide',
                'action' => 'createGuide',
            ]
        );

        return $this;
    }
}

?>