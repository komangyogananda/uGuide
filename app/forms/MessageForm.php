<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Check;

class MessageForm extends Form{
    public function initialize(){

        $this->add(
            new Text(
                'title',
                [
                    'placeholder' => 'Title'
                ]
            )
        );

        $this->add(
            new Text(
                'message',
                [
                    'placeholder' => 'Your message here...',
                ]
            )
        );

        $this->add(
            new Submit(
                'go',
                [
                    'value' => 'Send',
                ]
            )
        );
    }
}
    
    

?>