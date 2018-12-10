<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class GeneralRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'general',
        ]);

        $this->addGet(
            '/guide/profile/:params',
            [
                'action' => 'guideProfile',
                'params' => 1,
            ]
        );

        $this->addGet(
            '/payments/:params',
            [
                'action' => 'payments',
                'params' => 1,
            ]
        );

        return $this;
    }
}

?>