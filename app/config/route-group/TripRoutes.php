<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

class TripRoutes extends RouterGroup{
    public function initialize(){
        $this->setPaths([
            'controller' => 'trip',
        ]);
       
        $this->addGet(
            '/tourist/find',
            [
                'tipe' => 'tourist',
                'action' => 'findTourist',
            ]
        );

        $this->addGet(
            '/tourist/trip/show/:int',
            [
                'tipe' => 'tourist',
                'action' => 'showTrip',
                'tripId' => 1,
            ]
        );

        $this->addGet(
            '/guide/trip/show/:int',
            [
                'tipe' => 'guide',
                'action' => 'showTrip',
                'tripId' => 1,
            ]
        );

        $this->addPost(
            '/tourist/trip/show/:int',
            [
                'tipe' => 'tourist',
                'action' => 'addNewActivity',
                'tripId' => 1,
            ]
        );

        $this->addPost(
            '/guide/trip/show/:int',
            [
                'tipe' => 'guide',
                'action' => 'addNewActivity',
                'tripId' => 1,
            ]
        );

        $this->addGet(
            '/tourist/trip/interested/:int',
            [
                'tipe' => 'tourist',
                'action' => 'interestedGuide',
                'tripId' => 1,
            ]
        );

        $this->addPost(
            '/tourist/trip/interested/:int',
            [
                'tipe' => 'tourist',
                'action' => 'acceptInterest',
                'tripId' => 1,
            ]
        );

        $this->addPost(
            '/tourist/find',
            [
                'tipe' => 'tourist',
                'action' => 'createTourist',
            ]
        );

        $this->addGet(
            '/guide/find',
            [
                'tipe' => 'guide',
                'action' => 'findGuide',
            ]
        );

        $this->addPost(
            '/guide/trip/interested/ajaxPost',
            [
                'tipe' => 'guide',
                'action' => 'addNewInterested',
            ]
        );

        $this->addPost(
            '/guide/find',
            [
                'tipe' => 'guide',
                'action' => 'createGuide',
            ]
        );

        $this->addGet(
            '/tourist/payments/:int',
            [
                'tipe' => 'tourist',
                'action' => 'payments',
                'id' => 1,
            ]
        );

        $this->addGet(
            '/guide/payments/:int',
            [
                'tipe' => 'guide',
                'action' => 'payments',
                'id' => 1,
            ]
        );

        $this->addPost(
            '/tourist/payments/:int',
            [
                'tipe' => 'tourist',
                'action' => 'addPay',
                'id' => 1,
            ]
        );

        return $this;
    }
}

?>