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
                'action' => 'registerTourist',
            ]
        );

        $this->addGet(
            '/guide',
            [
                'action' => 'registerGuide',
            ]
        );

        return $this;
    }
}

?>