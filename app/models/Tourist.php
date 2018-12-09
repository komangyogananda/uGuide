<?php

use Phalcon\Mvc\Model;

class Tourist extends Model
{
	protected $id;
    protected $username;
	protected $email;
	protected $password;
	protected $fname;
	protected $lname;
	protected $phone;
    protected $location;
    protected $gender;
    protected $picture;
    public function initialize()
    {
        $this->setSource('tourist');
    }
    public function getId()
    {
        return $this->id;
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
    public function getUsername()
    {
        return $this->username;
    }
    public function getPicture()
    {
        return $this->picture;
    }

    public function setId($id)
    {
        $this->id = $id;
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
    public function setUsername($username)
    {
        $this->username = $username;
    }
    public function setPicture($picture)
    {
        $this->picture = $picture;
    }
}