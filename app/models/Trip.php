<?php

use Phalcon\Mvc\Model;

class Trip extends Model
{
	protected $id;
	protected $tourist_id;
	protected $guide_id;
	protected $date;
    protected $title;
	protected $description;
    protected $status;
    protected $min_budget;
    protected $max_budget;
    protected $duration;
    protected $destination;
    protected $person;
    public function initialize()
    {
        $this->setSource('trip');
    }
    public function getId()
    {
        return $this->id;
    }
    public function getTouristId()
    {
        return $this->tourist_id;
    }
    public function getGuideId()
    {
        return $this->guide_id;
    }
    public function getDate()
    {
        return $this->date;
    }
    public function getTitle()
    {
        return $this->title;
    }
    public function getDescription()
    {
        return $this->description;
    }
    public function getStatus()
    {
        return $this->status;
    }
    public function getMinBudget()
    {
        return $this->min_budget;
    }
    public function getMaxBudget()
    {
        return $this->max_budget;
    }
    public function getDuration()
    {
        return $this->duration;
    }
    public function getDestination()
    {
        return $this->destination;
    }
    public function getPerson()
    {
        return $this->person;
    }

    public function setPerson($person)
    {
        $this->person = $person;
    }
    public function setDestination($destination)
    {
        $this->destination = $destination;
    }
    public function setDuration($duration)
    {
        $this->duration = $duration;
    }
    public function setMaxBudget($max_budget)
    {
        $this->max_budget = $max_budget;
    }
    public function setMinBudget($min_budget)
    {
        $this->min_budget = $min_budget;
    }
    public function setId($id)
    {
        $this->id = $id;
    }
    public function setTouristId($tourist_id)
    {
        $this->tourist_id = $tourist_id;
    }
    public function setGuideId($guide_id)
    {
        $this->guide_id = $guide_id;
    }
    public function setDate($date)
    {
        $this->date = $date;
    }
    public function setTitle($title)
    {
        $this->title = $title;
    }
    public function setDescription($description)
    {
        $this->description = $description;
    }
    public function setStatus($status)
    {
        $this->status = $status;
    }
}