<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class TripController extends Controller{

        private function validateStep(){
            $id = $this->session->get('auth')['id'];
            $tipe = $this->session->get('auth')['type'];
            $idTrip = $this->dispatcher->getParam('tripId');
            $step = array(
                1 => false,
                2 => false,
                3 => false,
                4 => false,
                5 => false,
            );
            $trip = Trip::findFirst("id = '$idTrip'");
            if ($tipe == 'guide'){
                $client = User::findFirst("id = '$trip->tourist_id'");
            }else{
                $client = User::findFirst("id = '$trip->guide_id'");
            }
            $activity = Activity::find("trip_id = '$trip->id'");
            if (!$trip){
                (new Response())->redirect('404')->send();
            }
            $trans = Transaction::findFirst("trip_id = '$trip->id'");
            $transID = $trans->id;

            $service = Service::find("trip_id = '$idTrip'");

            $find = false;
            if ($trip) $find = true;
            if ($find) {
                if ($tipe == 'tourist') {
                    if ($trip->guide_id != NULL) $step[1] = true;
                }
                else if ($tipe == 'guide') $step[1] = true;
                if ($trans->status == 'ACCEPTED' && $step[1]) $step[2] = true;
                $date_array = getdate();
                $curr_date = $date_array['year']."-".$date_array['mon']."-".$date_array['mday'];
                if ($curr_date >= $trip->date && $step[2]) $step[3] = true;
                $date_finish = date_create($trip->date);
                date_add($date_finish, date_interval_create_from_date_string(($trip->duration+1)." days"));
                $date_finish = date_format($date_finish, 'Y-m-d');
                if ($curr_date >= $date_finish && $step[3]) $step[4] = true;
                if (!$trip->status && $step[4]) $step[5] = true;
            }
            $this->view->find = $find;
            $this->view->trip = $trip;
            $this->view->step = $step;
            $this->view->transID = $transID;
            $this->view->activity = $activity;
            $this->view->tipe = $tipe;
            $this->view->client = $client;
            $this->view->service = $service;
        }

        public function findTouristAction(){

            $form = new HolidayForm();

            $tipe = $this->dispatcher->getParam('tipe');

            $user = $this->session->get('auth')['id'];
            $active = Trip::findFirst("tourist_id = '$user' AND status = 1");
            if ($active) (new Response())->redirect($tipe.'/trip/interested/'.$active->id)->send();

            $this->view->tipe = $tipe;
            $this->view->form = $form;
        }

        public function createTouristAction(){
            $tipe = $this->dispatcher->getParam('tipe');
            $trip = new Trip();
            $trip->setTouristId($this->session->get('auth')['id']);
            $trip->setTitle($this->request->getPost('title'));
            $trip->setMinBudget($this->request->getPost('minBudget'));
            $trip->setMaxBudget($this->request->getPost('maxBudget'));
            $trip->setDate($this->request->getPost('startDate'));
            $trip->setDuration($this->request->getPost('duration'));
            $trip->setPerson($this->request->getPost('person'));
            $trip->setDescription($this->request->getPost('desc'));
            $trip->setDestination($this->request->getPost('location'));
            $trip->setStatus(1);
            if ($trip->save() === false){
                foreach($trip->getMessages() as $message){
                    echo $message;
                    echo '<br>';
                }
            }else{
                echo "create berhasil!";
            }
            $service = $this->request->getPost('services');
            foreach ($service as $key => $value) {
            	$serv = new Service();
            	$serv->init($trip->getId(), $value);
            	$serv->save();
            }
            $date = date_create($trip->getDate());
            date_add($date, date_interval_create_from_date_string("2 days"));
            $trans = new Transaction();
            $trans->init($trip->getId(), NULL, NULL, date_format($date, 'Y-m-d'), NULL, 'PENDING');
            $trans->save();
            (new Response())->redirect($tipe.'/dashboard')->send();
        }

        public function showTripAction(){
            $messageForm = new MessageForm();
            $this->validateStep();
            $this->view->messageForm = $messageForm;
        }

        public function findGuideAction(){
            $form = new InterestedForm();
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $location = $this->session->get('auth')['location'];
            $trip = Trip::find([
                'destination = :loc: AND status = 1 AND guide_id is NULL',
                'bind' => [
                    'loc' => $location
                ]
            ]);
            $service = array();
            $tourist = array();
            foreach ($trip as $key => $value) {
                $temp = $value->tourist_id;
                $tourist[$temp] = User::findFirst("id = '$temp'");
                $temp2 = $value->id;
                $service[$temp2] = Service::find("trip_id = '$temp2'");
            }
            $this->view->trip = $trip;
            $this->view->tourist = $tourist;
            $this->view->service = $service;
            $this->view->interestForm = $form;
        }

        public function interestedGuideAction(){

            $tipe = $this->dispatcher->getParam('tipe');
            $tripID = $this->dispatcher->getParam('tripId');
            $this->view->tipe = $tipe;
            $trip = Trip::findFirst("id = '$tripID' AND guide_id is NULL");
         
            $interests = Interest::find("trip_id = '$tripID'");
            $nama = array();
            foreach ($interests as $key => $value) {
                $id = $value->guide_id;
                $temp = User::findFirst("id = '$id'");
                $nama[$id] = $temp;
            }
            $status = true;
            if ($trip) $status = false;
            $this->view->interests = $interests;
            $this->view->status = $status;
            $this->view->nama = $nama;
        }

        public function acceptInterestAction(){
            $guide = $this->request->getPost('guide');
            $plan = $this->request->getPost('plan');
            $budget = $this->request->getPost('budget');
            $tripID = $this->dispatcher->getParam('tripId');
            $trip = Trip::findFirst("id = '$tripID'");
            $trip->setGuideId($guide);
            $trip->setDescription($trip->getDescription()."<br>Guide's plan:<br>".$plan);
            $trans = Transaction::findFirst("trip_id = $tripID");
            $trans->setAmount($budget);
            $trip->save();
            $trans->save();
            $interests = Interest::find("guide_id = '$guide'");
            foreach ($interests as $key => $value) {
                $value->delete();
            }
            (new Response())->redirect('tourist/active')->send();
        }

        public function addNewActivityAction(){
            //tambah new activity dari tourist|guide/trip/show dan /tourist/active
            $idTrip = $this->dispatcher->getParam('tripId');
            $tipe = $this->dispatcher->getParam('tipe');
            $activityConfirm = $this->request->getPost('activity');
            $deleteConfirm = $this->request->getPost('delete');
            $finishConfirm = $this->request->getPost('finish');
            $feedBackConfirm = $this->request->getPost('feedBack');

            if ($activityConfirm) {
                $idTrip = $this->dispatcher->getParam('tripId');
                $title = $this->request->getPost('title');
                $content = $this->request->getPost('message');
                $date_array = getdate();
                $curr_date = $date_array['year']."-".$date_array['mon']."-".$date_array['mday'];
                $activity = new Activity();
                $activity->init($idTrip,$tipe,$title,$content,$curr_date);
                $activity->save();
            }
            else if ($feedBackConfirm) {
                $guideID = $this->request->getPost('guideId');
                $touristID = $this->request->getPost('touristId');
                $desc = $this->request->getPost('feedBackDesc');
                $rating = $this->request->getPost('ratingNew');
                $feedback = new Feedback();
                $feedback->init($idTrip,$guideID,$touristID,$rating,$desc);
                $feedback->save();
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


            (new Response())->redirect($tipe.'/trip/show/'.$idTrip)->send();
        }

        public function addNewInterestedAction(){
            //tambah interested dari guide/find
            $request = $this->request;
            if ($request->isPost() == true){
                if ($request->isAjax() == true){
                    $amount = $this->request->getPost('budget');
                    $desc = $this->request->getPost('desc');
                    $trip = $this->request->getPost('tripId');
                    $guide = $this->session->get('auth')['id'];
                    $tourist = $this->request->getPost('touristId');
                    $interest = new Interest();
                    $interest->init($trip,$guide,$tourist,$amount,$desc);
                    $interest->save();
                }
            }
            
            //die();
        }

        public function paymentsAction(){
            //payments

            $tipe = $this->dispatcher->getParam('tipe');
            $idtrans = $this->dispatcher->getParam('id');
            $trans = Transaction::findFirst("trip_id = '$idtrans'");
            $this->view->tipe = $tipe;
            $this->view->trans = $trans;
        }

        public function addPayAction(){
            //payments

            $tipe = $this->dispatcher->getParam('tipe');
            $idtrans = $this->dispatcher->getParam('id');
            $trans = Transaction::findFirst("trip_id = '$idtrans'");
            $trans->setProof(base64_encode(file_get_contents($this->request->getUploadedFiles()[0]->getTempName())));
            $trans->save();
            (new Response())->redirect('tourist/payments/'.$idtrans)->send();
        }
    }
?>