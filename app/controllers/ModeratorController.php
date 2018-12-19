<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class ModeratorController extends BaseController{
    public function indexAction(){
    	$resp = new Response();
    	if (!$this->session->has('auth')) $resp->redirect('')->send();
    	else if ($this->session->get('auth')['type']!='moderator') $resp->redirect('')->send();

    	$pending = Transaction::find([
    		"status = 'PENDING'",
    		'order' => 'id'
    	]);
    	$this->view->pending = $pending;
    	$other = Transaction::find([
    		"status <> 'PENDING'",
    		'order' => 'id'
    	]);
    	$this->view->other = $other;

    }

	public function acceptAction(){
    	$resp = new Response();
    	if (!$this->session->has('auth')) $resp->redirect('')->send();
    	else if ($this->session->get('auth')['type']!='moderator') $resp->redirect('')->send();

    	$payID = $this->request->getPost('payID');
    	$trans = Transaction::findFirst("id = '$payID'");
    	$trans->setStatus("ACCEPTED");
		$trans->save();
		
		(new Response())->redirect('moderator')->send();

    }

    public function logoutAction(){
        $this->session->destroy('auth');
        (new Response())->redirect('')->send();
    }
}

?>