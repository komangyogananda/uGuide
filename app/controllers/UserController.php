<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;
    use Phalcon\Tag;

    class UserController extends BaseController{

        private function validateStep(){
            $id = $this->session->get('auth')['id'];
            $tipe = $this->session->get('auth')['type'];
            
            $step = array(
                1 => false,
                2 => false,
                3 => false,
                4 => false,
                5 => false,
            );
            
            
            if ($tipe == 'tourist'){
                $activeTrip = Trip::findFirst("tourist_id = '$id' AND status = 1");
                $activity = Activity::find("trip_id = '$activeTrip->id'");
            }else{
                $activeTrip = Trip::findFirst("guide_id = '$id' AND status = 1");
                $activity = Activity::find("trip_id = '$activeTrip->id'");
            }
            $trans = Transaction::findFirst("trip_id = '$activeTrip->id'");
            $transID = $trans->id;
            $find = false;
            if ($activeTrip) $find = true;
            if ($find) {
                if ($tipe == 'tourist') {
                    if ($activeTrip->guide_id != NULL) $step[1] = true;
                }
                else if ($tipe == 'guide') $step[1] = true;
                if ($trans->status == 'ACCEPTED' && $step[1]) $step[2] = true;
                $date_array = getdate();
                $curr_date = $date_array['year']."-".$date_array['mon']."-".$date_array['mday'];
                if ($curr_date >= $trip->date && $step[2]) $step[3] = true;
                $date_finish = date_create($activeTrip->date);
                date_add($date_finish, date_interval_create_from_date_string("'$activeTrip->duration' days"));
                $date_finish = date_format($date_finish, 'Y-m-d');
                if ($curr_date >= $date_finish && $step[3]) $step[4] = true;
                $feedback = Feedback::findFirst("trip_id = '$activeTrip->id'");
                if ($feedback && $step[4]) $step[5] = true;
            }
            $this->view->find = $find;
            $this->view->activeTrip = $activeTrip;
            $this->view->step = $step;
            $this->view->transID = $transID;
            $this->view->activity = $activity;
        }

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
            $this->authorize('dashboard');
            $this->view->tipe = $tipe;
            $id = $this->session->get('auth')['id'];
            $recents = Trip::find(
                [
                    'status = 0 AND (tourist_id = :id1: OR guide_id = :id2:)',
                    'bind' => [
                        'id1' => $id,
                        'id2' => $id,
                    ],
                    [
                    'order' => 'date',
                    'limit' => 3,
                    ]
                ]
            );
            $this->view->recents = $recents;
            $messageForm = new MessageForm();
            $this->view->messageForm = $messageForm;

            $this->validateStep();
        }

        public function activeAction(){

            $this->validateStep();

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $messageForm = new MessageForm();
            $this->view->messageForm = $messageForm;
        }

        public function historyAction(){
            $this->authorize('history');
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $id = $this->session->get('auth')['id'];
            $recents = Trip::find(
                [
                    'status = 0 AND (tourist_id = :id1: OR guide_id = :id2:)',
                    'bind' => [
                        'id1' => $id,
                        'id2' => $id,
                    ],
                    'order' => 'date'
                ]
            );
            $this->view->recents = $recents;
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