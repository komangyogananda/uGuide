<?php

use Phalcon\Mvc\Model;

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
}