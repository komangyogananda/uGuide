<?php 

$di->set(
    'router',
    function(){
        $router = new \Phalcon\Mvc\Router(false);

        $router->mount(
            new UserRoutes()
        );

        $router->mount(
            new ModeratorRoutes()
        );

        $router->mount(
            new TripRoutes()
        );

        $router->mount(
            new ProfileRoutes()
        );

        $router->add(
            '/',
            [
                'controller' => 'index',
                'action' => 'index',
            ]
        );
        

        $router->notFound([
            'controller' => 'index',
            'action' => 'show404',
        ]);

        return $router;
    }  
);

?>