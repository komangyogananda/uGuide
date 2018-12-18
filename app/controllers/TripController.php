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
            $activity = Activity::find("trip_id = '$trip->id'");
            if (!$trip){
                (new Response())->redirect('404')->send();
            }
            $trans = Transaction::findFirst("trip_id = '$trip->id'");
            $transID = $trans->id;
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
                date_add($date_finish, date_interval_create_from_date_string("'$trip->duration' days"));
                $date_finish = date_format($date_finish, 'Y-m-d');
                if ($curr_date >= $date_finish && $step[3]) $step[4] = true;
                $feedback = Feedback::findFirst("trip_id = '$trip->id'");
                if ($feedback && $step[4]) $step[5] = true;
            }
            $this->view->find = $find;
            $this->view->trip = $trip;
            $this->view->step = $step;
            $this->view->transID = $transID;
            $this->view->activity = $activity;
            $this->view->tipe = $tipe;
        }

        public function findTouristAction(){
            
            $form = new HolidayForm();

            $tipe = $this->dispatcher->getParam('tipe');
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
            $this->view->activity = $activity;
            $this->view->messageForm = $messageForm;
        }

        public function findGuideAction(){
            $form = new InterestedForm();
            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $location = $this->session->get('auth')['location'];
            $trip = Trip::find([
                'destination = :loc: AND status = 1',
                'bind' => [
                    'loc' => $location
                ]
            ]);
            $tourist = array();
            foreach ($trip as $key => $value) {
                $temp = $value->tourist_id;
                $tourist[$temp] = User::findFirst("id = '$temp'");
            }
            $this->view->trip = $trip;
            $this->view->tourist = $tourist;
            $this->view->interestForm = $form;
        }

        public function interestedGuideAction(){

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function addNewActivityAction(){
            //tambah new activity dari tourist|guide/trip/show dan /tourist/active
            $tipe = $this->dispatcher->getParam('tipe');
            $idTrip = $this->dispatcher->getParam('tripId');
            $title = $this->request->getPost('title');
            $content = $this->request->getPost('message');
            $date_array = getdate();
            $curr_date = $date_array['year']."-".$date_array['mon']."-".$date_array['mday'];
            $activity = new Activity();
            $activity->init($idTrip,$tipe,$title,$content,$curr_date);
            $activity->save();

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
            $this->view->tipe = $tipe;
        }

        public function feedBackAction(){

        }

    }
?>