<!DOCTYPE html>
<html>

    <head>
        <title> MyTrip - <?php if ($tipe == 'tourist') { ?>Tourist<?php } else { ?>Tour Guide<?php } ?> - uGuide</title>
        <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="<?= $this->url->get('semantic/dist/semantic.min.css') ?>">
<link href="<?= $this->url->get('css/style.css') ?>" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="<?= $this->url->get('js/jquery-3.3.1.min.js') ?>"></script>
<script src="<?= $this->url->get('semantic/dist/semantic.min.js') ?>"></script>
    </head>

    <body>

        

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="suitcase icon"></i>
            <span class="text">MyTrip</span>
        </div>
        <div class="right menu">
            <div class="item">
                <div class="ui icon input">
                    <input type="text" placeholder="Search...">
                    <i class="search link icon"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="ui stackable grid centered">
        <?php if ($find == true) { ?>
            <div class="row">
                <div class="ten wide column center aligned">
                    <div class="ui tablet stackable five steps">
                        <a class="<?php if ($step[1] == true) { ?>
                        completed
                        <?php } else { ?>
                        active
                        <?php } ?> step" 
                        href="<?php if ($tipe == 'tourist') { ?>
                            <?= $this->url->get('tourist/trip/interested/' . $trip->id) ?>
                        <?php } else { ?>
                            <?= $this->url->get('guide/find') ?>
                        <?php } ?>">
                            <i class="bullhorn icon"></i>
                            <div class="content">
                                <?php if ($tipe == 'tourist') { ?>
                                    <div class="title">Get A Guide</div>
                                <?php } else { ?>
                                    <div class="title">Get A Tourist</div>
                                <?php } ?>
                            </div>
                        </a>
                        <a class="<?php if ($step[2] == true) { ?>
                        completed
                        <?php } elseif ($step[1] == true && $step[2] == false) { ?>
                        active
                        <?php } else { ?>
                        disabled
                        <?php } ?> step" href="<?= $this->url->get('payments/' . $trip->id) ?>">
                            <i class="payment icon"></i>
                            <div class="content">
                                <?php if ($tipe == 'tourist') { ?>
                                    <div class="title">Pay your guide services.</div>
                                <?php } else { ?>
                                    <div class="title">Waiting for tourist's payments.</div>
                                <?php } ?>
                            </div>
                        </a>
                        <a class="<?php if ($step[3] == true) { ?>
                        completed
                        <?php } elseif ($step[2] == true && $step[3] == false) { ?>
                        active
                        <?php } else { ?>
                        disabled
                        <?php } ?> step" href="<?= $this->url->get($tipe . '/trip/show/' . $trip->id) ?>">
                            <i class="comments icon">
                            </i>
                            <div class="content">
                                <div class="title">Contact with your <?php if ($tipe == 'tourist') { ?>Guide<?php } else { ?>Tourist<?php } ?>.</div>
                            </div>
                        </a>
                        <a class="<?php if ($step[4] == true) { ?>
                        completed
                        <?php } elseif ($step[3] == true && $step[4] == false) { ?>
                        active
                        <?php } else { ?>
                        disabled
                        <?php } ?> step step" href="<?= $this->url->get($tipe . '/trip/show/' . $trip->id) ?>">
                            <i class="suitcase icon"></i>
                            <div class="content">
                                <div class="title">Trip Day!</div>
                            </div>
                        </a>
                        <a class="<?php if ($step[5] == true) { ?>
                        completed
                        <?php } elseif ($step[4] == true && $step[5] == false) { ?>
                        active
                        <?php } else { ?>
                        disabled
                        <?php } ?> step step" 
                        href="<?php if ($tipe == 'tourist') { ?>
                            <?= $this->url->get('tourist/trip/feedback/' . $trip->id) ?>
                        <?php } else { ?>
                            <?= $this->url->get($tipe . '/trip/show/' . $trip->id) ?>
                        <?php } ?>">
                        <?php if ($tipe == 'tourist') { ?>
                            <i class="star icon"></i>
                            <div class="content">
                                <div class="title">FeedBack</div>
                            </div>
                        <?php } else { ?>
                            <i class="icon">
                                <i class="fas fa-clipboard-check"></i>
                            </i>
                            <div class="content">
                                <div class="title">Finish Trip</div>
                            </div>
                        <?php } ?>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="eight wide column center aligned">
                    <div class="ui segment column middle aligned">
                        <div class="ui row">
                            <div class="column center aligned">
                                <h1 class="ui header">
                                My Trip 
                                </h1>
                                <h2 class="ui header">
                                    <i class="icon">
                                        <i class="fas fa-hiking"></i>
                                    </i>
                                </h2>
                            </div>
                        </div>
                        <div class="ui stackable grid centered" style="margin-top:10px">
                            <div class="eight wide column row">
                                <div class="column">
                                    <div class="ui info message">
                                        <h2 class="header">
                                            Trip Info
                                        </h2>
                                        <div class="ui divided list">
                                            <div class="item">
                                                <div class="ui blue horizontal label">Location</div>
                                                <div class="ui teal horizontal label"><?= $activeTrip->destination ?></div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Minimum Budget</div>
                                                <div class="ui teal horizontal label">Rp. <?= $activeTrip->min_budget ?></div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Maximum Budget</div>
                                                <div class="ui teal horizontal label">Rp. <?= $activeTrip->max_budget ?></div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Service(s)</div><br>
                                                <div class="item">
                                                    <div class="ui teal horizontal label">asdflksf</div>
                                                </div>
                                                <div class="item">
                                                    <div class="ui teal horizontal label">asdflksf</div>
                                                </div>
                                                <div class="item">
                                                    <div class="ui teal horizontal label">asdflksf</div>
                                                </div>
                                                <div class="item">
                                                    <div class="ui teal horizontal label">asdflksf</div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Start Date</div>
                                                <div class="ui teal horizontal label"><?= date('D, d-M-Y', strtotime($activeTrip->date)) ?></div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Duration</div>
                                                <div class="ui teal horizontal label"><?= $activeTrip->duration ?> Day(s)</div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Person</div>
                                                <div class="ui teal horizontal label"><?= $activeTrip->person ?> Person(s)</div>                                           
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Description</div>
                                                <div class="six wide column center aligned">
                                                        <div>
                                                            <div class="ui teal horizontal label">
                                                                Check Guide(s) interested in your trip!Check Guide(s) interested in your trip!Check Guide(s) interested in your trip!
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="column middle aligned">
                                    <h3 class="header">Your Guide</h3>
                                    <?php if ($activeTrip->guide_id != null) { ?>
                                        <div class="ui card centered">
                                            <div class="image">
                                                <img src="/images/avatar2/large/kristy.png">
                                            </div>
                                            <div class="content">
                                                <a class="header">Novan</a>
                                                <div class="meta">
                                                    <span class="location">Tangerang</span>
                                                </div>
                                                <div class="ui star rating" data-rating="5"></div>
                                                <div class="description">
                                                    Siap memandu anda kemanapun. Ahli dalam liburan bersama alam.
                                                </div>
                                            </div>
                                            <div class="extra content">
                                                <a>
                                                    <i class="icon">
                                                        <i class="fas fa-hiking"></i>
                                                    </i>
                                                    10 Activies
                                                </a>
                                                <div class="ui two buttons">
                                                    <div class="button">
                                                        <div class="ui basic green button">
                                                            Show Profile
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <div class="ui stackable grid centered">
                                            <div class="row">
                                                <div class="six wide column center aligned">
                                                    <div class="ui info message">
                                                        <h3 class="header">
                                                            Find a Guide First.
                                                        </h3>
                                                    </div>
                                                    <a href="<?= $this->url->get('tourist/trip/interested/1') ?>">
                                                        <div class="ui positive button">
                                                            Check Guide(s) interested in your trip!
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <h3 class="header">Activities</h3>
                                        <?php if ($this->length($activity) != 0) { ?>
                                            <div class="ui stackable grid">
                                                <div class="row">
                                                    <div class="twelve wide column right floated">
                                                        <div class="ui message green">
                                                            <div class="header">
                                                                Tourist - Arrival
                                                            </div>
                                                            <p>Kita dateng tanggal 20.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="twelve wide column left floated">
                                                        <div class="ui message blue">
                                                            <div class="header">
                                                                Guide - Response Arrival
                                                            </div>
                                                            <p>Saya tunggu di bandara.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } else { ?>
                                            <div class="ui info message">
                                                There is no activity yet.
                                            </div>
                                        <?php } ?>
                                        <?php if ($step[2] == true) { ?>
                                            <button id="addActivity" class="ui right floated button">
                                                <i class="plus icon"></i>
                                                Add New Message
                                            </button> 
                                        <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="column">
                                    <?php if ($tipe == 'tourist' && $step[2] == false) { ?>
                                        <button class="ui negative labeled icon button">
                                            <i class="close icon"></i>
                                            Delete Trip
                                        </button>
                                    <?php } elseif ($tipe == 'guide' && $step[4] == true) { ?>
                                        <button class="ui positive labeled icon button">
                                            <i class="check icon"></i>
                                            Finish Trip
                                        </button>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php } else { ?>
            <div class="row">
                <div class="segment eight wide column middle aligned">
                    <div class="ui attached segment">
                        <div class="column center aligned">
                            <h1 class="ui header">
                                <i class="window close outline icon"></i>
                            </h1>
                            <h2 class="ui header">
                            You have no active trip
                            </h2>
                        </div>
                    </div>
                    <a href="<?= $this->url->get('tourist/find') ?>">
                        <button class="positive fluid ui button">Click here to create new Trip.</button>
                    </a>
                </div>
            </div>
        <?php } ?>
    </div>  

    <div id="sidebarMenu" class="ui left vertical inverted sidebar labeled icon stackable menu">
        <div class="column">
            <img class="image" width=40 src="<?= $this->url->get('src/smallLogo.png') ?>">
        </div>

        <a href="<?= $this->url->get($tipe . '/dashboard') ?>" class="item">
            <i class="home icon"></i>
            Home
        </a>

        <a href="<?= $this->url->get($tipe . '/find') ?>" class="item">
            <i class="plus square icon"></i>
            <?php if ($tipe == 'tourist') { ?>
            Find a Guide
            <?php } else { ?>
            Find a Tourist
            <?php } ?>
        </a>
        
        <a href="<?= $this->url->get($tipe . '/history') ?>" class="item">
            <i class="history layout icon"></i>
            Recent Trip
        </a>
        
        <a href="<?= $this->url->get($tipe . '/active') ?>" class="item">
            <i class="suitcase icon"></i>
            My Trip
        </a>

        <a href="<?= $this->url->get($tipe . '/profile/edit') ?>" class="item">
            <i class="user icon"></i>
            Profile
        </a>

        <a href="<?= $this->url->get($tipe . '/logout') ?>" class="item">
            <i class="arrow alternate circle right icon"></i>
            Logout
        </a>
        
        <a class="right item sidebarToggle">
            <i class="angle double left icon"></i>
        </a>
    </div>

    <script>    

        $(".sidebarToggle").on("click", function(){
            $("#sidebarMenu").sidebar('toggle');
        });

        $('.ui.sticky').sticky();

    </script>
    
        <div class="ui small modal">
        <div class="header">Add New Message</div>
        <div class="content">
            <?= $this->tag->form(['class' => 'ui form']) ?>

                <div class="ui field">
                    <?= $messageForm->render('title') ?>
                </div>

                <div class="ui field">
                    <?= $messageForm->render('message') ?>
                </div>

                <div class="actions">
                    <?= $messageForm->render('go', ['class' => 'ui positive button']) ?>
                </div>

            </form>
        </div>
    </div>

    <script>
        $('#addActivity').on("click", function(){
            $('.small.modal').modal('show');
        });
    </script>



    </body>

</html>