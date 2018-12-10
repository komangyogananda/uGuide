<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class ModeratorController extends Controller{
    public function indexAction(){

    }
    public function logoutAction(){
        $this->session->destroy('auth');
        (new Response())->redirect('')->send();
    }
}

?>