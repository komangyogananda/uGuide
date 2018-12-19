<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Alnum;
use Phalcon\Validation\Validator\Digit;
use Phalcon\Validation\Validator\StringLength;

class User extends Model
{
	protected $id;
    protected $user_type;
    protected $username;
	protected $email;
	protected $password;
	protected $fname;
	protected $lname;
    protected $bio;
	protected $phone;
    protected $location;
    protected $gender;
    protected $rating;
    protected $picture;
    public function initialize()
    {
        $this->setSource('user');
        $this->setup(array(
            'notNullValidations' => false,
        ));
    }
    public function getId()
    {
        return $this->id;
    }
    public function getType()
    {
        return $this->user_type;
    }
    public function getUsername()
    {
        return $this->username;
    }
    public function getEmail()
    {
        return $this->email;
    }
    public function getPassword()
    {
        return $this->password;
    }
    public function getFname()
    {
        return $this->fname;
    }
    public function getLname()
    {
        return $this->lname;
    }
    public function getBio()
    {
        return $this->bio;
    }
    public function getPhone()
    {
        return $this->phone;
    }
    public function getLocation()
    {
        return $this->location;
    }
    public function getGender()
    {
        return $this->gender;
    }
    public function getRating()
    {
        return $this->rating;
    }
    public function getPicture()
    {
        return $this->picture;
    }

    public function setId($id)
    {
        $this->id = $id;
    }
    public function setType($user_type)
    {
        $this->user_type = $user_type;
    }
    public function setUsername($username)
    {
        $this->username = $username;
    }
    public function setEmail($email)
    {
        $this->email = $email;
    }
    public function setPassword($password)
    {
        $this->password = $password;
    }
    public function setFname($fname)
    {
        $this->fname = $fname;
    }
    public function setLname($lname)
    {
        $this->lname = $lname;
    }
    public function setBio($bio)
    {
        $this->bio = $bio;
    }
    public function setPhone($phone)
    {
        $this->phone = $phone;
    }
    public function setLocation($location)
    {
        $this->location = $location;
    }
    public function setGender($gender)
    {
        $this->gender = $gender;
    }
    public function setRating($rating)
    {
        $this->rating = $rating;
    }
    public function setPicture($picture)
    {
        $this->picture = $picture;
    }
     public function validation(){
        $validator = new Validation();

        $validator->add(
            'username',
            new Uniqueness(
                [
                    'message' => 'Username already exist.',
                       'model' => $this
                ]
            )
        );

        $validator->add(
            'username',
            new PresenceOf(
                [
                    'message' => 'Username required.'
                ]
            )
        );

        $validator->add(
            'username',
            new Alnum(
                [
                    'message' => 'Not a valid username.'
                ]
            )
        );

        $validator->add(
            'email',
            new Email(
                [
                    'message' => 'Not a valid e-mail address.'
                ]
            )
        );

        $validator->add(
            'email',
            new Uniqueness(
                [
                    'message' => 'Email address already exist',
                       'model' => $this
                ]
            )
        );

        $validator->add(
            'email',
            new PresenceOf(
                [
                    'message' => 'Email address required.'
                ]
            )
        );

        $validator->add(
            'email',
            new Email(
                [
                    'message' => 'Not a valid e-mail address.'
                ]
            )
        );

        $validator->add(
            'password',
            new PresenceOf(
                [
                    'message' => 'Password is required.'
                ]
            )
        );

        $validator->add(
            'fname',
            new PresenceOf(
                [
                    'message' => 'First name required.'
                ]
            )
        );

        $validator->add(
            'lname',
            new PresenceOf(
                [
                    'message' => 'Last name required.'
                ]
            )
        );

        $validator->add(
            'phone',
            new PresenceOf(
                [
                    'message' => 'Phone number required.'
                ]
            )
        );

        $validator->add(
            'phone',
            new Digit(
                [
                    'message' => 'Not a valid phone number.'
                ]
            )
        );

        $validator->add(
            'picture',
            new PresenceOf(
                [
                    'message' => 'Picture is required.'
                ]
            )
        );
        return $this->validate($validator);
    }
}