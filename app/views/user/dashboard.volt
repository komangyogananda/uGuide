{% extends 'layouts/base.volt' %}

{% block title %} Home - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="home icon"></i>
            <span class="text">Home</span>
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

    <div class="ui centered stackable grid">
        {% if find == false %}
            <div class="row">
                <div class="segment ten wide column middle aligned">
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
        {% else %}
            <div class="row">
                    <div class="segment ten wide column middle aligned">
                        <div class="ui five top attached steps">
                            <a class="{% if step[1] == true %}
                            completed disabled
                            {% else %}
                            active
                            {% endif %} step" 
                            href="{% if tipe == 'tourist' %}
                                {{ url('tourist/trip/interested/' ~ activeTrip.id) }}
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
                            {% endif %} step" href="{{ url(tipe ~ '/payments/' ~ activeTrip.id) }}">
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
                            {% endif %} step" href="{{ url(tipe ~'/trip/show/' ~ activeTrip.id) }}">
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
                            {% endif %} step step" href="{{ url(tipe ~ '/trip/show/' ~ activeTrip.id) }}">
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
                                {{ url('tourist/trip/feedback/' ~ activeTrip.id) }}
                            {% else %}
                                {{ url(tipe ~ '/trip/show/' ~ activeTrip.id) }}
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
                        <div class="ui attached segment">
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
                                                    <div class="ui teal horizontal label">{{ activeTrip.destination|capitalize }}</div>
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
                                                    <div class="ui blue horizontal label">Service(s)</div>
                                                    <div class="six wide column center aligned">
                                                        <div class="item">
                                                            {% for sr in service %}
                                                                <div class="ui teal horizontal label">{{ sr.value }}</div>
                                                            {% endfor %}
                                                        </div>
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
                                                                    {{ activeTrip.description }}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui stackable grid two column row">
                                <div class="column middle aligned">
                                        {% if tipe == 'tourist' %}
                                            <h3 class="header">Your Guide</h3>
                                            {% set idClient = activeTrip.guide_id %}
                                        {% else %}
                                            <h3 class="header">Your Tourist</h3>
                                            {% set idClient = activeTrip.tourist_id %}
                                        {% endif %}
                                        {% if activeTrip.guide_id != NULL %}
                                            <div class="ui card centered">
                                                <div class="image">
                                                        <img src="data:image/jpeg;base64,{{ client.picture }}">
                                                </div>
                                                <div class="content">
                                                <a class="header">{{ client.fname|capitalize ~ ' ' ~ client.lname|capitalize }}</a>
                                                    <div class="meta">
                                                        <span class="location">{{ client.location }}</span>
                                                    </div>
                                                    <div class="ui star rating" data-rating="5"></div>
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
                                                    </div>
                                                </div>
                                            </div>
                                        {% endif %}
                                </div>
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
                                </div>
                        </div>
                    </div>
                    <a href="{{ url(tipe ~ '/trip/show/' ~ activeTrip.id) }}">
                        <button class="positive fluid ui button">Click here for details.</button>
                    </a>
                </div>

            </div> 
        {% endif %} 

    <div class="row">
        <div class="segment ten wide column middle aligned">
            <div class="ui attached segment">
                <div class="row">
                    <div class="column center aligned">
                        <h1 class="ui header">
                        Recent Trip
                        </h 1>
                        <h2 class="ui header">
                            <i class="history layout icon"></i>
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="column center aligned">
                        {% if recents|length == 0 %}
                            <div class="content">
                                <h3 class="header">No recent trip yet.</h3>
                            </div>
                        {% else %}
                        <div class="ui grid">
                            {% for recent in recents %}
                                <div class="row">
                                    <div class="column">
                                        <div class="ui info message">
                                            <h3 class="header">
                                                <a class="ui image label">
                                                    {% if tipe == 'tourist' %}
                                                        <img src="data:image/jpeg;base64,{{ nama[recent.guide_id].picture }}">
                                                        {{ nama[recent.guide_id].fname|capitalize ~ ' ' ~ nama[recent.guide_id].lname|capitalize }}
                                                    {% else %}
                                                        <img src="data:image/jpeg;base64,{{ nama[recent.tourist_id].picture }}">
                                                        {{ nama[recent.tourist_id].fname|capitalize ~ ' ' ~ nama[recent.tourist_id].lname|capitalize }}
                                                    {% endif %}
                                                </a>
                                                <div class="header">{{ recent.title }}</div>
                                            </h3>
                                            <div class="item">
                                                <div class="ui teal horizontal label">{{ recent.destination }}</div>
                                                <div class="ui teal horizontal label">{{ date('D, d-M-Y', strtotime(recent.date)) }}</div>
                                                <div class="ui teal horizontal label">{{ recent.duration }} Day(s)</div>
                                                <div class="ui teal horizontal label">{{ recent.person }} Person(s)</div>
                                                <div class="ui teal horizontal label">{{ 'Rp. ' ~ recent.min_budget ~ ' - Rp. ' ~ recent.max_budget }}</div>
                                                {% for sr in services[recent.id] %}
                                                    <div class="ui teal horizontal label">{{ sr.value }}</div>
                                                {% endfor %}
                                                <div class="six wide column center aligned">
                                                    <div>
                                                        <div class="ui teal horizontal label">
                                                            {{ recent.description }}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                            </div>
                        {% endif %}
                    </div>
                </div>  
            </div>
            <a href="{{ url('tourist/history') }}">
                <button class="positive fluid ui button">Click here for details.</button>
            </a>
        </div>
    </div>

    <div class="row">
        <div class="segment ten wide column middle aligned">
            <div class="ui attached segment">
                <div class="column center aligned">
                    <h1 class="ui header">
                    News
                    </h 1>
                    <h2 class="ui header">
                        <i class="newspaper icon"></i>
                    </h2>
                </div>
            </div>
            <button class="positive fluid ui button">Click here for details.</button>
        </div>
    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}