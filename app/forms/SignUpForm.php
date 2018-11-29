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

class SignUpForm extends Form{
    public function initialize(){

        $this->add(
            new Text(
                'firstName',
                [
                    'maxlength' => 20,
                    'placeholder' => 'First Name',
                ]
            )
        );
        
        $this->add(
            new Text(
                'lastName',
                [
                    'maxlength' => 20,
                    'placeholder' => 'Last Name',
                ]
            )
        );

        $this->add(
            new Text(
                'username',
                [
                    'maxlength' => 30,
                    'placeholder' => 'Username',
                ]
            )
        );
    
        $this->add(
            new Email(
                'email',
                [
                    'placeholder' => 'Email',
                ]
            )
        );
    
        $this->add(
            new Password(
                'password',
                [
                    'placeholder' => 'Password',
                ]
            )
        );
    
        $this->add(
            new Password(
                'confpassword',
                [
                    'placeholder' => 'Confirmation Password',
                ]
            )
        );
    
        $this->add(
            new Select(
                'gender',
                [
                    'M' => 'Male',
                    'F' => 'Female',
                ]
            )
        );

        $this->add(
            new Text(
                'telephone',
                [
                    'maxlength' => 12,
                    'minlength' => 11,
                    'placeholder' => '085xxxxxxxxx',
                ]
            )
        );

        $this->add(
            new Select(
                'location',
                [
                    'aceh' => 'Aceh',
                    'Sumut' => 'Sumatera Utara',
                    'sumbar' => 'Sumatera Barat',
                    'Riau' => 'Riau',
                    'Jambi' => 'Jambi',
                    'Sumsel' => 'Sumatera Selatan',
                    'Bengkulu' => 'Bengkulu',
                    'Lampung' => 'Lampung',
                    'BaBel' => 'Kep. Bangka Belitung',
                    'kepRiau' => 'Kepulauan Riau',
                    'Jakarta' => 'Jakarta',
                    'Jabar' => 'Jawa Barat',
                    'Banten' => 'Banten',
                    'Jateng' => 'Jawa Tengah',
                    'Yogyakarta' => 'Yogyakarta',
                    'Jatim' => 'Jawa Timur',
                    'Kalbar' => 'Kalimantan Barat',
                    'Kalteng' => 'Kalimantan Tengah',
                    'Kalsel' => 'Kalimantan Selatan',
                    'Kaltim' => 'Kalimantan Timur',
                    'Kaltra' => 'Kalimantan Utara',
                    'Bali' => 'Bali',
                    'NTT' => 'Nusa Tenggara Timur',
                    'NTB' => 'Nusa Tenggara Barat',
                    'Sulut' => 'Sulawesi Utara',
                    'Sulteng' => 'Sulawesi Tengah',
                    'Sulsel' => 'Sulawesi Selatan',
                    'Sultengg' => 'Sulawesi Tenggara',
                    'Sulbar' => 'Sulawesi Barat',
                    'Gorontalo' => 'Gorontalo',
                    'Maluku' => 'Maluku',
                    'Maluku' => 'Maluku Utara',
                    'Papua' => 'Papua',
                    'Papua' => 'Papua Barat',
                ]
            )
        );

        $this->add( new Hidden('tipe') );

        $this->add (
            new File(
                'picture'
            )
        );

        $this->add(
            new Submit(
                'go',
                [
                    'value' => 'SignUp'
                ]
            )
        );

    }
}
    
    

?>