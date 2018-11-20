<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class IndexController extends Controller{
        public function show404Action(){
            echo "Tidak ada URL";
            die();
        }

        public function indexAction(){
            
        }
    }

?>