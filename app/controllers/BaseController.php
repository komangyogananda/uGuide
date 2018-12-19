<?php 

    use Phalcon\Mvc\Controller;
    use Phalcon\Http\Response;

    class BaseController extends Controller{
        
        public function authorize($url){
            $tipe = $this->dispatcher->getParam('tipe');
            $resp = new Response();
            if ($this->checkRememberMe() != 0) {
                $id = $this->checkRememberMe();
                $tmp = User::findFirst("id = '$id'");
                $tp = $tmp->getType();
                ///$resp->redirect($tp.'/'.$url)->send();
                if ($url == 'login') {
                    $resp->redirect($tp.'/dashboard')->send();
                }
                if ($tipe != $tp) {
                    $resp->redirect($tp.'/'.$url)->send();
                }
            }
            else if (!$this->session->has('auth')) {
                if ($url != 'login')
                    $resp->redirect($tipe.'/login')->send();
            }
            else if ($tipe == 'moderator') $resp->redirect('moderator')->send();
            else if ($this->session->get('auth')['type'] != $tipe) {
                $resp->redirect($this->session->get('auth')['type'].'/'.$url)->send();
            }
        }

        public function startRememberMe($id) {
            $this->cookies->set('remember-me', $id, time() + 7 * 86400);
        }

        public function checkRememberMe() {
            if ($this->hasRememberMe()) {
                if ($this->cookies->get('remember-me')->getExpiration() < time()) {
                   $this->cookies->get('remember-me')->delete();
                    return 0;
                }
                return $this->cookies->get('remember-me')->getValue();
            } else return 0;
        }

        public function destroySession() {
            $this->session->destroy('auth');
            $this->cookies->get('remember-me')->delete();
            return (New Response())->redirect('')->send();
        }

        public function hasRememberMe() {
            return ($this->cookies->has('remember-me'));
        }

        public function show404Action(){
            
        }
    }

?>