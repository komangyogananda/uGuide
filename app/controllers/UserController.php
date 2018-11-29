<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class UserController extends Controller{
        public function registerTouristAction(){
            $form = new SignUpForm();

            $this->view->form = $form;
        }
        public function registerGuideAction(){
            $form = new SignUpForm();

            $this->view->form = $form;
        }
        public function signUpAction(){
            $form = new SignUpForm();

            $this->view->form = $form;
        }
    }

?>