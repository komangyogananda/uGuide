<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class TripController extends Controller{

        public function findAction(){
            
            $form = new HolidayForm();

            $tipe = $this->dispatcher->getParam('tipe');
            $this->view->tipe = $tipe;
            $this->view->form = $form;
        }

        public function createAction(){
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

    }
?>