{% extends 'layouts/base.volt' %}

{% block title %} Home - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui menu">
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

    <div class="ui centered grid">
        <div class="row">
            <div class="segment ten wide column middle aligned">
                <div class="ui five top attached steps">
                    <div class="{% if step[1] == true %}
                    completed
                    {% else %}
                    active
                    {% endif %} step">
                        <i class="bullhorn icon"></i>
                        <div class="content">
                            <div class="title">Get A Guide</div>
                        </div>
                    </div>
                    <div class="{% if step[2] == true %}
                    completed
                    {% elseif step[1] == true and step[2] == false %}
                    active
                    {% else %}
                    disabled
                    {% endif %} step">
                        <i class="payment icon"></i>
                        <div class="content">
                            <div class="title">Pay your guide services.</div>
                        </div>
                    </div>
                    <div class="{% if step[3] == true %}
                    completed
                    {% elseif step[2] == true and step[3] == false %}
                    active
                    {% else %}
                    disabled
                    {% endif %} step">
                        <i class="comments icon">
                        </i>
                        <div class="content">
                            <div class="title">Contact with your guide.</div>
                        </div>
                    </div>
                    <div class="{% if step[4] == true %}
                    completed
                    {% elseif step[3] == true and step[4] == false %}
                    active
                    {% else %}
                    disabled
                    {% endif %} step step">
                        <i class="suitcase icon"></i>
                        <div class="content">
                            <div class="title">Trip Day!</div>
                        </div>
                    </div>
                    <div class="{% if step[5] == true %}
                    completed
                    {% elseif step[4] == true and step[5] == false %}
                    active
                    {% else %}
                    disabled
                    {% endif %} step step">
                        <i class="star icon"></i>
                        <div class="content">
                            <div class="title">FeedBack</div>
                        </div>
                    </div>
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
                    <div class="ui grid two column row">
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
                                    <div class="ui grid centered">
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
                                <div class="ui grid">
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
                        </div>
                </div>
            </div>
            <a href="{{ url('tourist/active') }}">
                <button class="positive fluid ui button">Click here for details.</button>
            </a>
        </div>

    </div>  

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
                            {% for recent in recents %}
                                <div class="ui column segment">
                                    <div class="item">
                                        <div class="content">
                                            <div class="header">Arrowhead Valley Camp</div>
                                            <div class="meta">
                                                <span class="price">$1200</span>
                                                <span class="stay">1 Month</span>
                                            </div>
                                            <div class="description">
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
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