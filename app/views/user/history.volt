{% extends 'layouts/base.volt' %}

{% block title %} History - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="history layout icon"></i>
            <span class="text">History</span>
        </div>
    </div>

    <div class="ui stackable grid centered">
        {% if recents|length == 0 %}
            <div class="row">
                <div class="eight wide column">
                    <div class="ui column attached segment center aligned">
                        <div class="item">
                            <h1 class="ui header">
                                No recent trip yet.
                            </h 1>
                            <h2 class="ui header">
                                <i class="history layout icon"></i>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        {% else %}
            <div class="row">
                <div class="eight wide column">
                    <div class="ui column attached segment">
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
                    </div>
                    <a href="{{ url(tipe ~ '/trip/show/' ~ recent.id) }}">
                        <button class="positive fluid ui button">Click here for details.</button>
                    </a>
                    {% endfor %}
                </div>
            </div>
        {% endif %}
        
    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}