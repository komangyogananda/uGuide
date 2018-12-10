<?php

use Phalcon\Mvc\Model;

class Activity extends Model
{
	protected $id;
	protected $trip_id;
	protected $amount;
	protected $date_paid;
    protected $date_expired;
    protected $proof;
    protected $status;
    public function initialize()
    {
        $this->setSource('activity');
    }
    public function onConstruct($trip_id, $amount, $date_paid, $date_expired, $proof, $status)
    {
    	$this->trip_id = $trip_id;
    	$this->amount = $amount;
    	$this->date_paid = $date_paid;
        $this->date_expired = $date_expired;
        $this->proof = $proof;
        $this->status = $status;
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
    public function getDatePaid()
    {
    	return $this->date_paid;
    }
    public function getDateExpired()
    {
        return $this->date_expired;
    }
    public function getProof()
    {
        return $this->proof;
    }
    public function getStatus()
    {
        return $this->status;
    }
}