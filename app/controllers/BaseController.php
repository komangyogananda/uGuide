<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class BaseController extends Controller{
        
        public function authorize($url){
            $tipe = $this->dispatcher->getParam('tipe');
            $resp = new Response();
            if (!$this->session->has('auth')) $resp->redirect('')->send();
            else if ($tipe == 'moderator') $resp->redirect('moderator')->send();
            else if ($this->session->get('auth')['type'] != $tipe) {
                $resp->redirect($this->session->get('auth')['type'].'/'.$url)->send();
            }
        }

        public function show404Action(){
            
        }
    }

?>