<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class UserController extends Controller{
        public function registerAction(){
            $form = new SignUpForm();

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->form = $form;
        }
        
        public function showloginAction(){
            $form = new LoginForm();

            $this->view->form = $form;
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function loginAction(){
            $tipe = $this->request->getPost('tipe');
            $password = $this->request->getPost('password');
            $email = $this->request->getPost('email');
            $user = User::findFirst("email = '$email'");

            if ($user){
                if (password_verify($password, $user->getPassword())){
                    $this->session->set(
                        'auth',
                        [
                            'id' => $user->getId(),
                            'type' => $user->getType(),
                            'username' => $user->getUsername(),
                            'email' => $user->getEmail(),
                            'firstName' => $user->getFname(),
                            'lastName' => $user->getLname()
                        ]
                    );
                    echo "Login Success";
                }else{
                    echo "verify Gagal";
                }
            }else{
                echo "user gaada";
            }

        }
        
        public function dashboardAction(){
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function profileAction(){

            $form = new SignUpForm();
            $this->view->form = $form;

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function activeAction(){

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function historyAction(){
            
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function findAction(){
            
            $form = new HolidayForm();

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->form = $form;
        }

        public function storeAction(){
            $user = new User();
            $user->setType($this->request->getPost('tipe'));
            $user->setUsername($this->request->getPost('username'));
            $user->setEmail($this->request->getPost('email'));
            $user->setPassword(password_hash($this->request->getPost('password'), PASSWORD_BCRYPT, ['cost' => 15]));
            $user->setFname($this->request->getPost('firstName'));
            $user->setLname($this->request->getPost('lastName'));
            $user->setPhone($this->request->getPost('telephone'));
            $user->setLocation($this->request->getPost('location'));
            $user->setGender($this->request->getPost('gender'));
            $user->setRating(0);
            $user->setPicture($this->request->getPost('picture'));
            if ($user->save() === false){
                foreach($user->getMessages() as $message){
                    echo $message;
                    echo '<br>';
                }
            }else{
                echo "pendaftaran berhasil!";
            }

        }

    }

?>