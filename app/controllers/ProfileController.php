<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class ProfileController extends Controller{
        public function editProfileAction(){
            $form = new SignUpForm();
            $email = $this->session->get('auth')['email'];
            $user = User::findFirst("email = '$email'");
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->form = $form;
            $this->view->user = $user;
        }
    }

?>