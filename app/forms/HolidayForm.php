<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Date;

class HolidayForm extends Form{
    public function initialize(){

        $this->add(
            new Text(
                'title',
                [
                    'minlength' => 1,
                    'maxlength' => 30,
                    'placeholder' => 'Title',
                ]
            )
        );
        
        $this->add(
            new Numeric(
                'minBudget',
                [
                    'min' => 1,
                    'placeholder' => 'Minimum Budget',
                ]
            )
        );

        $this->add(
            new Numeric(
                'maxBudget',
                [
                    'min' => 1,
                    'placeholder' => 'Maximum Budget',
                ]
            )
        );

        $this->add(
            new TextArea(
                'desc',
                [
                    'placeholder' => 'Username',
                ]
            )
        );
    
        $this->add(
            new Date(
                'startDate',
                [
                    'placeholder' => 'Start Date',
                ]
            )
        );
    
        $this->add(
            new Numeric(
                'duration',
                [
                    'min' => 1,
                    'placeholder' => 'duration',
                ]
            )
        );
    
        $this->add(
            new Numeric(
                'person',
                [
                    'min' => 1,
                    'placeholder' => 'Number of persons',
                ]
            )
        );
    
        $this->add(
            new Select(
                'services[]',
                [
                    '' => 'Services',
                    'Food' => 'Standard Food',
                    'Hotel' => 'Hotel',
                    'Culinary' => 'Culinary Food',
                    'Transportation' => 'Transportation',
                    'Ticket' => 'Ticket for all places',
                ],
                [
                    'multiple' => true
                ]
            )
        );

        $this->add(
            new Select(
                'location',
                [
                    'Aceh' => 'Aceh',
                    'Sumatera Utara' => 'Sumatera Utara',
                    'Sumatera Barat' => 'Sumatera Barat',
                    'Riau' => 'Riau',
                    'Jambi' => 'Jambi',
                    'Sumatera Selatan' => 'Sumatera Selatan',
                    'Bengkulu' => 'Bengkulu',
                    'Lampung' => 'Lampung',
                    'Bangka Belitung' => 'Kep. Bangka Belitung',
                    'Kepulauan Riau' => 'Kepulauan Riau',
                    'Jakarta' => 'Jakarta',
                    'Jawa Barat' => 'Jawa Barat',
                    'Banten' => 'Banten',
                    'Jawa Tengah' => 'Jawa Tengah',
                    'Yogyakarta' => 'Yogyakarta',
                    'Jawa Timur' => 'Jawa Timur',
                    'Kalimantan Barat' => 'Kalimantan Barat',
                    'Kalimantan Tengah' => 'Kalimantan Tengah',
                    'Kalimantan Selatan' => 'Kalimantan Selatan',
                    'Kalimantan Timur' => 'Kalimantan Timur',
                    'Kalimantan Utara' => 'Kalimantan Utara',
                    'Bali' => 'Bali',
                    'Nusa Tenggara Timur' => 'Nusa Tenggara Timur',
                    'Nusa Tenggara Barat' => 'Nusa Tenggara Barat',
                    'Sulawesi Utara' => 'Sulawesi Utara',
                    'Sulawesi Tengah' => 'Sulawesi Tengah',
                    'Sulawesi Selatan' => 'Sulawesi Selatan',
                    'Sulawesi Tenggara' => 'Sulawesi Tenggara',
                    'Sulawesi Barat' => 'Sulawesi Barat',
                    'Gorontalo' => 'Gorontalo',
                    'Maluku' => 'Maluku',
                    'Maluku Utara' => 'Maluku Utara',
                    'Papua' => 'Papua',
                    'Papua Barat' => 'Papua Barat',
                ]
            )
        );

        $this->add(
            new Submit(
                'publish',
                [
                    'value' => 'Publish'
                ]
            )
        );

    }
}
    
    

?>