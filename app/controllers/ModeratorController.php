<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class ModeratorController extends BaseController{
    public function indexAction(){
    	$resp = new Response();
    	if (!$this->session->has('auth')) $resp->redirect('')->send();
    	else if ($this->session->get('auth')['type']!='moderator') $resp->redirect('')->send();
    }
    public function logoutAction(){
        $this->session->destroy('auth');
        (new Response())->redirect('')->send();
    }
}

?>