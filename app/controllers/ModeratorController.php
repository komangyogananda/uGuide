<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class ModeratorController extends BaseController{
    public function indexAction(){
    	$this->authorize('');
    	$resp = new Response();

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

    	$payID = $this->request->getPost('payID');
    	$trans = Transaction::findFirst("id = '$payID'");
    	$trans->setStatus("ACCEPTED");
		$trans->save();
		
		(new Response())->redirect('moderator')->send();

    }

    public function logoutAction(){
    	$this->destroySession();
    }
}

?>