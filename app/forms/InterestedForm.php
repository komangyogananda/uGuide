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

class InterestedForm extends Form{
    public function initialize(){

        $this->add(
            new Text(
                'tourist',
                [
                    'placeholder' => 'touristid'
                ]
            )
        );

        $this->add(
            new Text(
                'trip',
                [
                    'placeholder' => 'tripId'
                ]
            )
        );

        $this->add(
            new TextArea(
                'desc',
                [
                    'placeholder' => 'Describe your plan here',
                ]
            )
        );

        $this->add(
            new Numeric(
                'budget',
                [
                    'min' => 1,
                ]
            )
        );
    }
}
    
    

?>