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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui attached segment">
                                <h3 class="header">Feedback From Users</h3>
                                <div class="ui feed">
                                    <div class="event">
                                        <div class="label">
                                        <img src="/images/avatar/small/elliot.jpg">
                                        </div>
                                        <div class="content">
                                        <div class="summary">
                                            <a class="user">
                                            Elliot Fu
                                            </a> added you as a friend
                                            <div class="date">
                                            1 Hour Ago
                                            </div>
                                        </div>
                                        <div class="meta">
                                            <a class="like">
                                            <i class="like icon"></i> 4 Likes
                                            </a>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="event">
                                        <div class="label">
                                        <img src="/images/avatar/small/helen.jpg">
                                        </div>
                                        <div class="content">
                                        <div class="summary">
                                            <a>Helen Troy</a> added <a>2 new illustrations</a>
                                            <div class="date">
                                            4 days ago
                                            </div>
                                        </div>
                                        <div class="extra images">
                                            <a><img src="/images/wireframe/image.png"></a>
                                            <a><img src="/images/wireframe/image.png"></a>
                                        </div>
                                        <div class="meta">
                                            <a class="like">
                                            <i class="like icon"></i> 1 Like
                                            </a>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="event">
                                        <div class="label">
                                        <img src="/images/avatar/small/jenny.jpg">
                                        </div>
                                        <div class="content">
                                        <div class="summary">
                                            <a class="user">
                                            Jenny Hess
                                            </a> added you as a friend
                                            <div class="date">
                                            2 Days Ago
                                            </div>
                                        </div>
                                        <div class="meta">
                                            <a class="like">
                                            <i class="like icon"></i> 8 Likes
                                            </a>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="event">
                                        <div class="label">
                                        <img src="/images/avatar/small/joe.jpg">
                                        </div>
                                        <div class="content">
                                        <div class="summary">
                                            <a>Joe Henderson</a> posted on his page
                                            <div class="date">
                                            3 days ago
                                            </div>
                                        </div>
                                        <div class="extra text">
                                            Ours is a life of constant reruns. We're always circling back to where we'd we started, then starting all over again. Even if we don't run extra laps that day, we surely will come back for more of the same another day soon.
                                        </div>
                                        <div class="meta">
                                            <a class="like">
                                            <i class="like icon"></i> 5 Likes
                                            </a>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="event">
                                        <div class="label">
                                        <img src="/images/avatar/small/justen.jpg">
                                        </div>
                                        <div class="content">
                                        <div class="summary">
                                            <a>Justen Kitsune</a> added <a>2 new photos</a> of you
                                            <div class="date">
                                            4 days ago
                                            </div>
                                        </div>
                                        <div class="extra images">
                                            <a><img src="/images/wireframe/image.png"></a>
                                            <a><img src="/images/wireframe/image.png"></a>
                                        </div>
                                        <div class="meta">
                                            <a class="like">
                                            <i class="like icon"></i> 41 Likes
                                            </a>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}