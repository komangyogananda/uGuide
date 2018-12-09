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
                'services',
                [
                    '' => 'Services',
                    'Food' => 'Standard Food',
                    'Hotel' => 'Hotel',
                    'Culinary' => 'Culinary Food',
                    'Transportation' => 'Transportation',
                    'Ticket' => 'Ticket for all places',
                ]
            )
        );

        $this->add(
            new Select(
                'location',
                [
                    'aceh' => 'Aceh',
                    'sumut' => 'Sumatera Utara',
                    'sumbar' => 'Sumatera Barat',
                    'riau' => 'Riau',
                    'jambi' => 'Jambi',
                    'sumsel' => 'Sumatera Selatan',
                    'bengkulu' => 'Bengkulu',
                    'lampung' => 'Lampung',
                    'babel' => 'Kep. Bangka Belitung',
                    'kepriau' => 'Kepulauan Riau',
                    'jakarta' => 'Jakarta',
                    'jabar' => 'Jawa Barat',
                    'banten' => 'Banten',
                    'jateng' => 'Jawa Tengah',
                    'yogyakarta' => 'Yogyakarta',
                    'jatim' => 'Jawa Timur',
                    'kalbar' => 'Kalimantan Barat',
                    'kalteng' => 'Kalimantan Tengah',
                    'kalsel' => 'Kalimantan Selatan',
                    'kaltim' => 'Kalimantan Timur',
                    'kaltra' => 'Kalimantan Utara',
                    'bali' => 'Bali',
                    'ntt' => 'Nusa Tenggara Timur',
                    'ntb' => 'Nusa Tenggara Barat',
                    'sulut' => 'Sulawesi Utara',
                    'sulteng' => 'Sulawesi Tengah',
                    'sulsel' => 'Sulawesi Selatan',
                    'sultengg' => 'Sulawesi Tenggara',
                    'sulbar' => 'Sulawesi Barat',
                    'gorontalo' => 'Gorontalo',
                    'maluku' => 'Maluku',
                    'malukuut' => 'Maluku Utara',
                    'papua' => 'Papua',
                    'papuabar' => 'Papua Barat',
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