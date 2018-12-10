<?php

use Phalcon\Mvc\Model;

class Interest extends Model
{
	protected $id;
	protected $trip_id;
	protected $guide_id;
    protected $tourist_id;
    protected $budget;
    protected $plan;
    public function initialize()
    {
        $this->setSource('interest');
    }
    public function init($trip_id, $guide_id, $tourist_id, $budget, $plan)
    {
    	$this->trip_id = $trip_id;
    	$this->guide_id = $guide_id;
        $this->tourist_id = $tourist_id;
        $this->budget = $budget;
        $this->plan = $plan;
    }
    public function getId()
    {
    	return $this->id;
    }
    public function getTripId()
    {
    	return $this->trip_id;
    }
    public function getGuideId()
    {
        return $this->guide_id;
    }
    public function getTouristId()
    {
        return $this->tourist_id;
    }
    public function getBudget()
    {
        return $this->budget;
    }
    public function getPlan()
    {
        return $this->plan;
    }
}