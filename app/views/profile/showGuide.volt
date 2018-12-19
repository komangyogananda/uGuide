{% extends 'layouts/base.volt' %}

{% block title %} Guide Profile {% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="blind icon"></i>
            <span class="text">Guide Profile</span>
        </div>
    </div>
    
    <div class="ui stackable grid centered">
        <div class="row">
            <div class="six wide column center aligned">
                    <div class="ui segment">
                            <div class="ui left attached rail">
                                <div class="ui segment">
                                    <div class="ui card centered">
                                        <div class="image">
                                             <img src="data:image/jpeg;base64,{{guide.picture}}">
                                        </div>
                                        <div class="content">
                                            <a class="header">{{guide.fName ~ ' ' ~ guide.lName}}</a>
                                            <div class="meta">
                                                <span class="location">{{guide.location}}</span>
                                            </div>
                                            <div id="guideRating" class="ui star rating" data-rating="{{ rating }}"></div>
                                        </div>
                                        <div class="extra content">
                                            <a>
                                                <i class="icon">
                                                    <i class="fas fa-hiking"></i>
                                                </i>
                                                {{ total }} Feedback(s)
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui attached segment">
                                <h3 class="header">Feedback From Users</h3>
                                <div class="ui feed">
                                    {% for fb in feedback %}
                                        <div class="event">
                                            <div class="label">
                                                <img src="data:image/jpeg;base64,{{ nama[fb.tourist_id].picture }}">
                                            </div>
                                            <div class="content">
                                                <div class="summary">
                                                    <a>{{ nama[fb.tourist_id].fname|capitalize ~ ' ' ~ nama[fb.tourist_id].lname|capitalize }}</a> posted this
                                                </div>
                                                <div class="extra text">
                                                        {{ fb.comment }}
                                                </div>
                                                <div class="meta">
                                                    <div class="ui star rating userRating" data-rating="{{ fb.rating }}"></div>
                                                </div>
                                            </div>
                                        </div>
                                    {% endfor %}
        
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>

    <script>
    

        $('.userRating').rating({
            maxRating: 5
        });

        $('.userRating').rating('disable');

        $('#guideRating').rating({
            maxRating: 5
        });

        $('#guideRating').rating('disable');

    </script>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}