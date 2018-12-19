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
            $new = $this->request->getPost('newPass');
            $conf = $this->request->getPost('confpassword');
            if (!password_verify($cur, $pw)) {
                $this->flashSession->error('Wrong Password!');
                return $this->response->redirect($tipe.'/profile/edit');
            } else if ($new != $conf) {
                $this->flashSession->error('Confirmation Password does not match!');
                return $this->response->redirect($tipe.'/profile/edit');
            } else if (strlen($new)!= 0 && strlen($new) < 8) {
                $this->flashSession->error('Password must be at least 8 characters!');
                return $this->response->redirect($tipe.'/profile/edit');
            }
            else {
                $user->setFName($this->request->getPost('firstName'));
                $user->setLName($this->request->getPost('lastName'));
                if ($new != '')
                    $user->setPassword(password_hash($this->request->getPost('newPass'), PASSWORD_BCRYPT, ['cost' => 15]));
                $user->setPhone($this->request->getPost('telephone'));
                $user->setGender($this->request->getPost('gender'));
                $user->setLocation($this->request->getPost('location'));
                if ($this->request->getUploadedFiles()[0]->getTempName() != '')
                    // $this->flashSession->error('$this->request->getUploadedFiles()[0]->getTempName()');
                   $user->setPicture(base64_encode(file_get_contents($this->request->getUploadedFiles()[0]->getTempName())));

                if (!$user->save()) {
                    // $this->flashSession->error("ERROR");
                    foreach ($user->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                } else {
                    $this->flashSession->success("User was edited successfully");
                }
                return $this->response->redirect($tipe.'/profile/edit');
            }
        }
        public function showGuideAction(){
            $id = $this->dispatcher->getParam('id');
            $guide = User::findFirst("id = '$id'");
            if ($guide == null) {
                return (New Response())->redirect('show404')->send();
            }
            $feedback = Feedback::find("guide_id = '$id'");
            $tipe = 'tourist';
            $this->view->tipe = 'tourist';
            $this->view->guide = $guide;
        }
    }

?>