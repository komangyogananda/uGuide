<?php

use Phalcon\Mvc\Model;

class Activity extends Model
{
	protected $id;
	protected $trip_id;
	protected $sender_type;
	protected $title;
	protected $content;
	protected $date;
    public function initialize()
    {
        $this->setSource('activity');
    }
    public function onConstruct($trip_id, $sender_type, $title, $content, $date)
    {
    	$this->trip_id = $trip_id;
    	$this->sender_type = $sender_type;
    	$this->title = $title;
    	$this->content = $content;
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
    public function getSenderType()
    {
    	return $this->sender_type;
    }
    public function getTitle()
    {
    	return $this->title;
    }
    public function getContent()
    {
    	return $this->content;
    }
    public function getDate()
    {
    	return $this->date;
    }
    
}