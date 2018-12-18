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
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Alnum;
use Phalcon\Validation\Validator\Digit;

class SignUpForm extends Form{
    public function initialize(){

        $fname = 
        new Text(
            'firstName',
            [
                'minlength' => 1,
                'maxlength' => 30,
                'placeholder' => 'First Name',
            ]
        );

        $fname->addValidators([
            new PresenceOf([
                'message' => 'First name required.'
            ])
        ]);

        $this->add($fname);
        
        $lname = 
        new Text(
            'lastName',
            [
                'minlength' => 1,
                'maxlength' => 30,
                'placeholder' => 'Last Name',
            ]
        );

        $lname->addValidators([
            new PresenceOf([
                'message' => 'Last name required.'
            ])
        ]);

        $this->add($lname);

        $username = 
        new Text(
            'username',
            [
                'maxlength' => 30,
                'placeholder' => 'Username',
            ]
        );

        $username->addValidators([
            new Alnum([
                'message' => 'Not a valid username.'
            ]),
            new PresenceOf([
                'message' => 'Username required.'
            ])
        ]);

        $this->add($username);
    
        $email = 
        new Email(
            'email',
            [
                'placeholder' => 'Email',
            ]
        );

        $email->addValidators([
            new PresenceOf([
                'message' => 'Email address required.'
            ]),
            new EmailValidator([
                'message' => 'Not a valid e-mail address.'
            ])
        ]);

        $this->add($email);
    
        $password = 
        new Password(
            'password',
            [
                'minlength' => 8,
                'placeholder' => 'Password',
            ]
        );

        $password->addValidators([
            new PresenceOf([
                'message' => 'Password is required.'
            ])
        ]);

        $this->add($password);
    
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

        $phone = 
        new Text(
            'telephone',
            [
                'maxlength' => 12,
                'minlength' => 11,
                'placeholder' => '085xxxxxxxxx',
            ]
        );

        $phone->addValidators([
            new PresenceOf([
                'message' => 'Phone number required.'
            ]),
            new Digit([
                'message' => 'Not a valid phone number.'
            ])
        ]);

        $this->add($phone);

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

        $this->add( new Hidden('tipe') );

        $picture = 
        new File(
            'picture'
        );


        $picture->addValidators([
            new PresenceOf([
                'message' => 'Picture required.'
            ])
        ]);

        $this->add($picture);

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