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
                $client = User::findFirst("id = '$activeTrip->guide_id'");
            }else{
                $activeTrip = Trip::findFirst("guide_id = '$id' AND status = 1");
                $activity = Activity::find("trip_id = '$activeTrip->id'");
                $client = User::findFirst("id = '$activeTrip->tourist_id'");
            }
            $trans = Transaction::findFirst("trip_id = '$activeTrip->id'");
            $transID = $trans->id;
            $service = Service::find("trip_id = '$activeTrip->id'");
            $this->view->service = $service;
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
                if ($curr_date >= $activeTrip->date && $step[2]) $step[3] = true;
                $date_finish = date_create($activeTrip->date);
                date_add($date_finish, date_interval_create_from_date_string("'$activeTrip->duration' days"));
                $date_finish = date_format($date_finish, 'Y-m-d');
                if ($curr_date >= $date_finish && $step[3]) $step[4] = true;
                if (!$trip->status && $step[4]) $step[5] = true;
            }
            $this->view->find = $find;
            $this->view->activeTrip = $activeTrip;
            $this->view->step = $step;
            $this->view->transID = $transID;
            $this->view->activity = $activity;
            $this->view->client = $client;
        }

        public function registerAction(){
            $form = new SignUpForm();

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->form = $form;
        }
        
        public function showloginAction(){
            $this->authorize('login');
            $form = new LoginForm();

            $this->view->form = $form;
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function loginAction(){
            
            $tipe = $this->request->getPost('tipe');
            $password = $this->request->getPost('password');
            $email = $this->request->getPost('email');
            $rememberMe = $this->request->getPost('remember');
            // echo $rememberMe;
            // die();
            $user = User::findFirst("email = '$email'");
            if ($user == null) {
                $this->flashSession->error('User not found!');
                return (New Response())->redirect($tipe.'/login');
            }
            if ($user->getType() !== $tipe) {
                $this->flashSession->error('User Type not Found!');
                return (New Response())->redirect($tipe.'/login');
            }
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
                    if ($rememberMe == 'on') {
                        $this->startRememberMe($user->getId());
                    }
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
                    $this->flashSession->error('Wrong Username/Password Combination!');
                    return (New Response())->redirect($tipe.'/login');
                }
            }

        }

        public function logoutAction(){
            $this->destroySession();    
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
            $nama = array();
            $services = array();
            foreach ($recents as $key => $value) {
                if ($tipe == 'tourist') $temp = $value->guide_id;
                else $temp = $value->tourist_id;
                $user = User::findFirst("id = '$temp'");
                $nama[$temp] = $user;
                $services[$value->id] = Service::find("trip_id = '$value->id'");
            }
            $this->view->services = $services;
            $this->view->nama = $nama;
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
            $nama = array();
            $services = array();
            foreach ($recents as $key => $value) {
                if ($tipe == 'tourist') $temp = $value->guide_id;
                else $temp = $value->tourist_id;
                $user = User::findFirst("id = '$temp'");
                $nama[$temp] = $user;
                $services[$value->id] = Service::find("trip_id = '$value->id'");
            }
            $this->view->services = $services;
            $this->view->nama = $nama;
            $this->view->recents = $recents;
        }

        public function storeAction(){  
            $tipe = $this->dispatcher->getParam('tipe');
            $form = new SignUpForm();
            if ($this->request->isPost()) {
                if ($form->isValid($this->request->getPost()) == false) {
                    foreach ($form->getMessages() as $message) {
                        $this->flashSession->error($message);
                    }
                    return (new Response())->redirect($tipe)->send();
                } else {
                    if (strlen($this->request->getPost('password')) < 8) {
                        $this->flashSession->error('Password must be at least 8 characters!');
                        return (new Response())->redirect($tipe)->send();
                    }
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
                    $user->setPicture(base64_encode(file_get_contents($this->request->getUploadedFiles()[0]->getTempName())));
                    if (!$user->save()) {
                        foreach ($user->getMessages() as $message) {
                            $this->flashSession->error($message);
                        }
                        return (new Response())->redirect($tipe)->send();
                    } else {
                        $this->flashSession->success("User was created successfully");
                        return (new Response())->redirect($tipe.'/login')->send();
                    }
                }
            }
            $this->view->form = $form;
            (new Response())->redirect($tipe.'/login')->send();
        }

        public function allActiveAction(){
            $tipe = $this->dispatcher->getParam('tipe');
            $idTrip = $this->request->getPost('trip');
            $activityConfirm = $this->request->getPost('activity');
            $deleteConfirm = $this->request->getPost('delete');
            $finishConfirm = $this->request->getPost('finish');
            // die();
            if($activityConfirm){
                $title = $this->request->getPost('title');
                $content = $this->request->getPost('message');
                $date_array = getdate();
                $curr_date = $date_array['year']."-".$date_array['mon']."-".$date_array['mday'];
                $activity = new Activity();
                $activity->init($idTrip,$tipe,$title,$content,$curr_date);
                $activity->save();
            }
            else if ($finishConfirm) {
                $trip = Trip::findFirst("id = '$idTrip'");
                $trip->setStatus(0);
                $trip->save();
            }
            else if ($deleteConfirm) {
                $feedback = Feedback::find("trip_id = '$idTrip'");
                foreach ($feedback as $value) {
                    $value->delete();
                }
                $service = Service::find("trip_id = '$idTrip'");
                foreach ($service as $value) {
                    $value->delete();
                }
                $Transaction = Transaction::find("trip_id = '$idTrip'");
                foreach ($Transaction as $value) {
                    $value->delete();
                }
                $activity = Activity::find("trip_id = '$idTrip'");
                foreach ($activity as $value) {
                    $value->delete();
                }
                $interest = Interest::find("trip_id = '$idTrip'");
                foreach ($interest as $value) {
                    $value->delete();
                }
                $trip = Trip::findFirst("id = '$idTrip'");
                $trip->delete();
            }

            (new Response())->redirect($tipe.'/active')->send();
        }

    }

?>