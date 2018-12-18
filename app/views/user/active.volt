{% extends 'layouts/base.volt' %}

{% block title %} MyTrip - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

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
        {% if find == true %}
            <div class="row">
                <div class="ten wide column center aligned">
                    <div class="ui tablet stackable five steps">
                        <a class="{% if step[1] == true %}
                        completed
                        {% else %}
                        active
                        {% endif %} step" 
                        href="{% if tipe == 'tourist' %}
                            {{ url('tourist/trip/interested/' ~ trip.id) }}
                        {% else %}
                            {{ url('guide/find') }}
                        {% endif %}">
                            <i class="bullhorn icon"></i>
                            <div class="content">
                                {% if tipe == 'tourist' %}
                                    <div class="title">Get A Guide</div>
                                {% else %}
                                    <div class="title">Get A Tourist</div>
                                {% endif %}
                            </div>
                        </a>
                        <a class="{% if step[2] == true %}
                        completed
                        {% elseif step[1] == true and step[2] == false %}
                        active
                        {% else %}
                        disabled
                        {% endif %} step" href="{{ url('payments/' ~ trip.id) }}">
                            <i class="payment icon"></i>
                            <div class="content">
                                {% if tipe == 'tourist' %}
                                    <div class="title">Pay your guide services.</div>
                                {% else %}
                                    <div class="title">Waiting for tourist's payments.</div>
                                {% endif %}
                            </div>
                        </a>
                        <a class="{% if step[3] == true %}
                        completed
                        {% elseif step[2] == true and step[3] == false %}
                        active
                        {% else %}
                        disabled
                        {% endif %} step" href="{{ url(tipe ~'/trip/show/' ~ trip.id) }}">
                            <i class="comments icon">
                            </i>
                            <div class="content">
                                <div class="title">Contact with your {% if tipe == 'tourist' %}Guide{% else %}Tourist{% endif %}.</div>
                            </div>
                        </a>
                        <a class="{% if step[4] == true %}
                        completed
                        {% elseif step[3] == true and step[4] == false %}
                        active
                        {% else %}
                        disabled
                        {% endif %} step step" href="{{ url(tipe ~ '/trip/show/' ~ trip.id) }}">
                            <i class="suitcase icon"></i>
                            <div class="content">
                                <div class="title">Trip Day!</div>
                            </div>
                        </a>
                        <a class="{% if step[5] == true %}
                        completed
                        {% elseif step[4] == true and step[5] == false %}
                        active
                        {% else %}
                        disabled
                        {% endif %} step step" 
                        href="{% if tipe == 'tourist' %}
                            {{ url('tourist/trip/feedback/' ~ trip.id) }}
                        {% else %}
                            {{ url(tipe ~ '/trip/show/' ~ trip.id) }}
                        {% endif %}">
                        {% if tipe == 'tourist' %}
                            <i class="star icon"></i>
                            <div class="content">
                                <div class="title">FeedBack</div>
                            </div>
                        {% else %}
                            <i class="icon">
                                <i class="fas fa-clipboard-check"></i>
                            </i>
                            <div class="content">
                                <div class="title">Finish Trip</div>
                            </div>
                        {% endif %}
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
                                                <div class="ui teal horizontal label">{{ activeTrip.destination|upper }}</div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Minimum Budget</div>
                                                <div class="ui teal horizontal label">Rp. {{ activeTrip.min_budget }}</div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Maximum Budget</div>
                                                <div class="ui teal horizontal label">Rp. {{ activeTrip.max_budget }}</div>
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
                                                <div class="ui teal horizontal label">{{ date('D, d-M-Y', strtotime(activeTrip.date)) }}</div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Duration</div>
                                                <div class="ui teal horizontal label">{{ activeTrip.duration }} Day(s)</div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Person</div>
                                                <div class="ui teal horizontal label">{{ activeTrip.person }} Person(s)</div>                                           
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
                                    {% if activeTrip.guide_id != NULL %}
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
                                    {% else %}
                                        <div class="ui stackable grid centered">
                                            <div class="row">
                                                <div class="six wide column center aligned">
                                                    <div class="ui info message">
                                                        <h3 class="header">
                                                            Find a Guide First.
                                                        </h3>
                                                    </div>
                                                    <a href="{{ url('tourist/trip/interested/1') }}">
                                                        <div class="ui positive button">
                                                            Check Guide(s) interested in your trip!
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <h3 class="header">Activities</h3>
                                        {% if activity|length != 0 %}
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
                                        {% else %}
                                            <div class="ui info message">
                                                There is no activity yet.
                                            </div>
                                        {% endif %}
                                        {% if step[2] == true %}
                                            <button id="addActivity" class="ui right floated button">
                                                <i class="plus icon"></i>
                                                Add New Message
                                            </button> 
                                        {% endif %}
                                </div>
                            </div>
                        </div>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="column">
                                    {% if tipe == 'tourist' AND step[2] == false %}
                                        <button class="ui negative labeled icon button endButton">
                                            <i class="close icon"></i>
                                            Delete Trip
                                        </button>
                                    {% elseif tipe == 'guide' AND step[4] == true %}
                                        <button class="ui positive labeled icon button endButton">
                                            <i class="check icon"></i>
                                            Finish Trip
                                        </button>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {% else %}
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
                    <a href="{{ url(tipe ~ '/find') }}">
                        <button class="positive fluid ui button">Click here to {% if tipe == 'tourist' %}create{% else %}find{% endif %} a new Trip.</button>
                    </a>
                </div>
            </div>
        {% endif %}
    </div>

    {% if tipe == 'tourist' AND step[2] == false %}
        <div id="endAction" class="ui tiny modal">
            <div class="ui icon header">
                <i class="trash alternate icon"></i>
                Delete Trip
            </div>
            <div class="content">
                <p>Are you sure want to delete this trip ?</p>
            </div>
            <div class="actions">
                <div class="ui green ok inverted button">
                    <i class="checkmark icon"></i>
                    Yes
                </div>
            </div>
        </div>
    {% elseif tipe == 'guide' AND step[4] == true %}
        <div id="endAction" class="ui tiny modal">
            <div class="ui icon header">
                <i class="check circle icon"></i>
                Finish Trip
            </div>
            <div class="content">
                <p>Finish this trip ?</p>
            </div>
            <div class="actions">
                <div class="ui green ok inverted button">
                    <i class="checkmark icon"></i>
                    Yes
                </div>
            </div>
        </div>
    {% endif %}

    <script>

        $('.endButton').on('click', function(){
            $('#endAction').modal('show');
        });
        
    </script>

    {% include 'layouts/sidebar.volt' %}
    
    {% include 'layouts/message.volt' %}

{% endblock %}