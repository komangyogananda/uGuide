<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;
    use Phalcon\Tag;

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
            if ($user->getType() !== $tipe) echo "$tipe user not found";
            else if ($user){
                if (password_verify($password, $user->getPassword())){
                    $this->session->set(
                        'auth',
                        [
                            'id' => $user->getId(),
                            'type' => $user->getType(),
                            'username' => $user->getUsername(),
                            'email' => $user->getEmail(),
                            'firstName' => $user->getFname(),
                            'lastName' => $user->getLname(),
                            'location' => $user->getLocation()
                        ]
                    );
                    echo "Login Success";
                    $resp = new Response();
                    if ($tipe == 'tourist') {
                        $resp->redirect('tourist/dashboard')->send();
                    }
                    else if ($tipe == 'guide') {
                        $resp->redirect('guide/dashboard')->send();
                    }
                    else {
                        $resp->redirect('moderator')->send();
                    }
                }else{
                    echo "failed to verify";
                }
            }else{
                echo "user not found";
            }

        }

        public function logoutAction(){
            $this->session->destroy('auth');
            (new Response())->redirect('')->send();      
        }
        
        public function dashboardAction(){
            $tipe = $this->dispatcher->getParam('tipe');
            $resp = new Response();
            if (!$this->session->has('auth')) (new Response())->redirect('')->send();
            else if ($this->session->get('auth')['type'] != $tipe) {
                if ($this->session->get('auth')['type'] == 'tourist') $resp->redirect('tourist/dashboard')->send();
                else if ($this->session->get('auth')['type'] == 'guide') $resp->redirect('guide/dashboard')->send();
                else $resp->redirect('moderator')->send();
            }
            $this->view->tipe = $tipe;
            $id = $this->session->get('auth')['id'];
            $recent = Trip::find(
                [
                    'status = 0 AND (tourist_id = 1 OR guide_id = 1)',
                    'bind' => [
                        1 => $id
                    ],
                    'order' => 'date',
                    //'limit' => 3
                ]
            );
            $this->view->recent = $recent;
            $messageForm = new MessageForm();
            $this->view->messageForm = $messageForm;
        }

        public function profileAction(){

            $form = new SignUpForm();
            $this->view->form = $form;

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function activeAction(){

            $id = $this->session->get('auth')['id'];
            $tipe = $this->session->get('auth')['type'];
            
            $step = array(
                1 => false,
                2 => false,
                3 => false,
                4 => false,
                5 => false,
            );

            $activity = NULL;
            if ($tipe == 'tourist'){
                $activeTrip = Trip::findFirst("tourist_id = '$id'");
                $activity = Activity::find("trip_id = '$activeTrip->id'");
            }else{
                $activeTrip = Trip::findFirst("guide_id = '$id'");
            }
            $findActivity;
            if (count($activity)) $findActivity = true;
            else $findActivity = false;
            $find;
            if ($activeTrip){
                $find = true;
            }else{
                $find = false;
            }
            $this->view->find = $find;
            $this->view->activeTrip = $activeTrip;
            $this->view->step = $step;
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->activity = $activity;
            $this->view->findActivity = $findActivity;
            $messageForm = new MessageForm();
            $this->view->messageForm = $messageForm;
        }

        public function historyAction(){
            
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $id = $this->session->get('auth')['id'];
            $history = Trip::find(
                [
                    'status = 0 AND (tourist_id = 1 OR guide_id = 1)',
                    'bind' => [
                        1 => $id,
                    ],
                    'order' => 'date'
                ]
            );
            $this->view->history = $history;
        }

        public function storeAction(){
            $form = new SignUpForm();
            if ($this->request->isPost()) {
                if ($form->isValid($this->request->getPost()) == false) {
                    foreach ($form->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                } else {
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
                    if (!$user->save()) {
                        $this->flash->error($user->getMessages());
                    } else {
                        $this->flash->success("User was created successfully");
                        Tag::resetInput();
                    }
                }
            }
            $this->view->form = $form;

        }

    }

?>