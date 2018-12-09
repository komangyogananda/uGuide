<?php

use Phalcon\Mvc\Model;

class Trip extends Model
{
	protected $id;
	protected $tourist_id;
	protected $guide_id;
	protected $transaction_id;
	protected $date;
	protected $description;
    protected $status;
    public function initialize()
    {
        $this->setSource('guide');
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
    public function getTransactionId()
    {
        return $this->transaction_id;
    }
    public function getDate()
    {
        return $this->date;
    }
    public function getDescription()
    {
        return $this->description;
    }
    public function getStatus()
    {
        return $this->status;
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
    public function setTransactionId($transaction_id)
    {
        $this->transaction_id = $transaction_id;
    }
    public function setDate($date)
    {
        $this->date = $date;
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