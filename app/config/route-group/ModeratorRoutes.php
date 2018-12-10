<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class ModeratorRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'moderator',
        ]);

        $this->addGet(
            '/moderator',
            [
                'action' => 'index',
            ]
        );

        $this->addGet(
            '/moderator/xxx/yyy/logout',
            [
                'action' => 'logout',
            ]
        );

        return $this;
    }
}

?>