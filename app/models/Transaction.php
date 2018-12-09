<?php

use Phalcon\Mvc\Model;

class Activity extends Model
{
	protected $id;
	protected $trip_id;
	protected $amount;
	protected $date;
    public function initialize()
    {
        $this->setSource('activity');
    }
    public function onConstruct($trip_id, $amount, $date)
    {
    	$this->trip_id = $trip_id;
    	$this->amount = $amount;
    	$this->date = $date;
    }
    public function getId()
    {
    	return $this->id;
    }
    public function getTripId()
    {
    	return $this->trip_id;
    }
    public function getAmount()
    {
    	return $this->amount;
    }
    public function getDate()
    {
    	return $this->date;
    }
    
}