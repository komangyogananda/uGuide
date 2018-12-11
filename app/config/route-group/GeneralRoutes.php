<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class GeneralRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'general',
        ]);

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