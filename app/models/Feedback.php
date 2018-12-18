<?php

use Phalcon\Mvc\Model;

class Feedback extends Model
{
	protected $id;
	protected $trip_id;
	protected $guide_id;
    protected $tourist_id;
    protected $rating;
    protected $comment;
    public function initialize()
    {
        $this->setSource('feedback');
    }
    public function init($trip_id, $guide_id, $tourist_id, $rating, $comment)
    {
    	$this->trip_id = $trip_id;
    	$this->guide_id = $guide_id;
        $this->tourist_id = $tourist_id;
        $this->rating = $rating;
        $this->comment = $comment;
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
    public function getRating()
    {
        return $this->rating;
    }
    public function getComment()
    {
        return $this->comment;
    }
}