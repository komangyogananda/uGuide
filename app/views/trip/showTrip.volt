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
            <div class="row">
                <div class="ten wide column center aligned">
                    <div class="ui tablet stackable five steps">
                        <a class="{% if step[1] == true %}
                        completed disabled
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
                        completed disabled
                        {% elseif step[1] == true and step[2] == false %}
                        active
                        {% else %}
                        disabled
                        {% endif %} step" href="{{ url(tipe ~ '/payments/' ~ trip.id) }}">
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
                        completed disabled
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
                        completed disabled
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
                        completed disabled
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
                                                <div class="ui teal horizontal label">{{ trip.destination|capitalize }}</div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Minimum Budget</div>
                                                <div class="ui teal horizontal label">Rp. {{ trip.min_budget }}</div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Maximum Budget</div>
                                                <div class="ui teal horizontal label">Rp. {{ trip.max_budget }}</div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Service(s)</div><br>
                                                <div class="item">
                                                    {% for sr in service %}
                                                        <div class="ui teal horizontal label">{{ sr.value }}</div>
                                                    {% endfor %}
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Start Date</div>
                                                <div class="ui teal horizontal label">{{ date('D, d-M-Y', strtotime(trip.date)) }}</div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Duration</div>
                                                <div class="ui teal horizontal label">{{ trip.duration }} Day(s)</div>
                                            </div>
                                            <div class="item">                                                
                                                <div class="ui blue horizontal label">Person</div>
                                                <div class="ui teal horizontal label">{{ trip.person }} Person(s)</div>                                           
                                            </div>
                                            <div class="item">
                                                <div class="ui blue horizontal label">Description</div>
                                                <div class="six wide column center aligned">
                                                        <div>
                                                            <div class="ui teal horizontal label">
                                                                {{ trip.description }}
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
                                    <h3 class="header">Your {% if tipe == 'tourist'%}Guide{% else %}Tourist{% endif %}</h3>
                                    {% if trip.guide_id != NULL %}
                                        <div class="ui card centered">
                                            <div class="image">
                                                    <img src="data:image/jpeg;base64,{{ client.picture }}">
                                            </div>
                                            <div class="content">
                                            <a class="header">{{ client.fname|capitalize ~ ' ' ~ client.lname|capitalize }}</a>
                                                <div class="meta">
                                                    <span class="location">{{ client.location }}</span>
                                                </div>
                                                <div class="ui star rating" data-rating="2"></div>
                                            </div>
                                            <div class="extra content">
                                                <a>
                                                    <i class="icon">
                                                        <i class="fas fa-hiking"></i>
                                                    </i>
                                                    10 Activies
                                                </a>
                                                {% if tipe == 'tourist' %}
                                                    <a href="{{ url('guide/profile/show/' ~ client.id) }}">
                                                        <div class="ui two buttons">
                                                            <div class="button">
                                                                <div class="ui basic green button">
                                                                    Show Profile
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                {% endif %}
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
                                                    <a href="{{ url('tourist/trip/interested/' ~ trip.id) }}">
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
                                            {% for ac in activity %}
                                                <div class="row">
                                                    <div class="twelve wide column {% if ac.sender_type == 0%}right{% else %}left{% endif %} floated">
                                                        <div class="ui message {% if ac.sender_type == 0%}green{% else %}blue{% endif %}">
                                                            <div class="header">
                                                                {% if ac.sender_type == 0%}Tourist{% else %}Guide{% endif %} - {{ ac.title }}
                                                            </div>
                                                            <p>{{ ac.content }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            {% endfor %}
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
                                    {% if tipe == 'tourist' %}
                                        {% if step[2] == false %}
                                        <button id="actionButton" class="ui negative labeled icon button">
                                            <i class="close icon"></i>
                                            Delete Trip
                                        </button>

                                        <div id="actionModal" class="ui tiny basic modal">
                                            <div class="ui icon header">
                                                <i class="trash alternate icon"></i>
                                                Delete Trip
                                            </div>
                                            <div class="content">
                                                <p>Are you sure want to delete this trip ?</p>
                                            </div>
                                            <form id="delete" method="post">
                                                <input type="hidden" name="delete" value="yes">
                                            </form>
                                            <div class="deleteButton actions">
                                                <div class="ui green ok inverted button">
                                                    <i class="checkmark icon"></i>
                                                    Yes
                                                </div>
                                            </div>
                                        </div>

                                        <script>
                                        
                                            $("#actionButton").on("click", function(){
                                                $("#actionModal").modal("show");
                                            });

                                            $('.deleteButton').on('click', function(){
                                                $('form#delete').submit();
                                            });  

                                        </script>

                                        {% elseif step[4] == true%}
                                            <button id="actionButton" class="ui positive labeled icon button">
                                                <i class="check icon"></i>
                                                FeedBack
                                            </button>
    
                                            <div id="actionModal" class="ui tiny modal">
                                                <div class="ui icon header">
                                                    <i class="archive icon"></i>
                                                    FeedBack Trip
                                                </div>
                                                <div class="content center aligned">
                                                    <div class="ui massive star rating"></div>
                                                </div>
                                                <form id="feedBack" method="post" class='ui form'>
                                                    <input type="hidden" name="feedBack" value="yes">
                                                    <input id="ratingNew" type="hidden" name="ratingNew">
                                                    <input type="hidden" name="guideId" value="{{ trip.guide_id }}">
                                                    <input type="hidden" name="tripId" value="{{ trip.id }}">
                                                    <input type="hidden" name="touristId" value="{{ trip.tourist_id }}">
                                                    <div class="field">
                                                        <input type="text" name="feedBackDesc" id="feedBackDesc" placeholder="Your comments...">
                                                    </div>
                                                </form>
                                                <div class="feedBackButton actions">
                                                    <div class="ui green ok inverted button">
                                                        <i class="checkmark icon"></i>
                                                        Yes
                                                    </div>
                                                </div>
                                            </div>
    
                                            <script>
                                            
                                                $("#actionButton").on("click", function(){
                                                    $("#actionModal").modal("show");
                                                });

                                                $('.feedBackButton').on('click', function(){
                                                    $('form#feedBack').submit();
                                                }); 

                                                $('.massive.rating').rating({
                                                    initialRating: 0,
                                                    maxRating: 5
                                                });

                                                $('.massive.rating').rating({
                                                    initialRating: 0,
                                                    maxRating: 5
                                                });


                                                $('.massive.rating').on('click', function(){
                                                    var rating = $('.rating').rating('get rating')[1];
                                                    $('#ratingNew').val($rating);
                                                    $('.rating').rating('disable');
                                                });
    
                                            </script>
                                        {% endif %}
                                        <script>
                                        
                                                $('.rating').rating({
                                                    maxRating: 5
                                                });

                                                $('.rating').rating('disable');

                                        </script>
                                    {% elseif tipe == 'guide' AND step[4] == true %}
                                        <button id="actionButton" class="ui positive labeled icon button">
                                            <i class="check icon"></i>
                                            Finish
                                        </button>
                                        <div id="actionModal" class="ui tiny modal">
                                            <div class="ui icon header">
                                                <i class="check circle icon"></i>
                                                Finish Trip
                                            </div>
                                            <div class="content">
                                                <p>Finish this trip ?</p>
                                            </div>
                                            <form id="finish" method="post">
                                                <input type="hidden" name="finish" value="yes">
                                            </form>
                                            <div class="finishButton actions">
                                                <div class="ui green ok inverted button">
                                                    <i class="checkmark icon"></i>
                                                    Yes
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                        
                                            $("#actionButton").on("click", function(){
                                                $("#actionModal").modal("show");
                                            });

                                            $('.finishButton').on('click', function(){
                                                $('form#finish').submit();
                                            });  

                                        </script>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {% if step[4] == true AND tipe == 'tourist' %}
            {% endif %}
    </div>  

    {% include 'layouts/sidebar.volt' %}
    
    {% include 'layouts/message.volt' %}

{% endblock %}