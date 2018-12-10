<?php

use Phalcon\Mvc\Model;

class Service extends Model
{
	protected $id;
	protected $trip_id;
	protected $value;
    public function initialize()
    {
        $this->setSource('service');
    }
    public function onConstruct($trip_id, $value)
    {
    	$this->trip_id = $trip_id;
    	$this->value = $value;
    }
    public function getId()
    {
    	return $this->id;
    }
    public function getTripId()
    {
    	return $this->trip_id;
    }
    public function getValue()
    {
    	return $this->value;
    }
    
}