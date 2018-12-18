<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class ProfileController extends BaseController{
        
        public function editProfileAction(){
            $this->authorize('profile/edit');
            $form = new SignUpForm();
            $email = $this->session->get('auth')['email'];
            $user = User::findFirst("email = '$email'");
            $tipe = $this->session->get('auth')['type'];
            $this->view->tipe = $tipe;
            $this->view->form = $form;
            $this->view->user = $user;
        }

        public function editProfileSubmitAction(){
            $tipe = $this->session->get('auth')['type'];
            if ($this->request->isPost()) {
                $this->response->redirect($tipe.'/profile/edit');
            }
            $email = $this->session->get('auth')['email'];
            $user = User::findFirst("email = '$email'");
            $pw = $user->getPassword();
            $cur = $this->request->getPost('password');
            if (!password_verify($cur, $pw)) {
                $this->flashSession->error('Wrong Password!');
                return $this->response->redirect($tipe.'/profile/edit');
            }   
        }
        public function showGuideAction(){
            $tipe = 'tourist';
            $this->view->tipe = 'tourist';
        }
    }

?>