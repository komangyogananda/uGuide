<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class TripController extends Controller{

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
        }

        public function showTripAction(){
            $id = $this->session->get('auth')['id'];
            $tipeUser = $this->session->get('auth')['type'];
            $tipe = $this->dispatcher->getParam('tipe');
            $idTrip = $this->dispatcher->getParam('tripId');
            $messageForm = new MessageForm();

            $step = array(
                1 => false,
                2 => false,
                3 => false,
                4 => false,
                5 => false,
            );

            $trip = Trip::findFirst("id = '$idTrip'");
            $activity = Activity::find("trip_id = '$idTrip'");

            if (!$trip){
                (new Response())->redirect('404')->send();
            }

            $this->view->trip = $trip;
            $this->view->step = $step;
            $this->view->tipe = $tipe;
            $this->view->activity = $activity;
            $this->view->messageForm = $messageForm;
        }

        public function findGuideAction(){
            $sameLocation;
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
            $this->view->trip = $trip;
            $this->view->interestForm = $form;
        }

        public function interestedGuideAction(){

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
        }

        public function addNewActivityAction(){
            //tambah new activity dari tourist|guide/trip/show dan /tourist/active
            $idTrip = $this->dispatcher->getParam('tripId');
            (new Response())->redirect('tourist/trip/show/'.$idTrip)->send();
        }

        public function addNewInterestedAction(){
            //tambah interested dari guide/find
            
        }

        public function paymentsAction(){
            //payments

        }

    }
?>