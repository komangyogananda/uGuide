{% extends 'layouts/base.volt' %}

{% block title %} MyTrip - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui menu">
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

    <div class="ui grid centered">
        <div class="row">
            <div class="eleven wide column center aligned">
                <div class="ui tablet stackable five steps">
                    <div class="completed step">
                        <i class="bullhorn icon"></i>
                        <div class="content">
                            <div class="title">Get A Guide</div>
                            <div class="description">Blablabla</div>
                        </div>
                    </div>
                    <div class="completed step">
                        <i class="payment icon"></i>
                        <div class="content">
                            <div class="title">Pay your guide services.</div>
                            <div class="description">Blablabla</div>
                        </div>
                    </div>
                    <div class="active step">
                        <i class="comments icon">
                        </i>
                        <div class="content">
                            <div class="title">Contact with your guide.</div>
                            <div class="description">Blablabla</div>
                        </div>
                    </div>
                    <div class="disabled step">
                        <i class="suitcase icon"></i>
                        <div class="content">
                            <div class="title">Trip Day!</div>
                            <div class="description">Blablabla</div>
                        </div>
                    </div>
                    <div class="disabled step">
                        <i class="star icon"></i>
                        <div class="content">
                            <div class="title">FeedBack</div>
                            <div class="description">Blablabla</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ui centered grid">
        <div class="row">
            <div class="eleven wide column center aligned">
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
                    <div class="ui grid">
                        <div class="row">
                            <div class="column middle aligned">
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
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <h3 class="header">Activities</h3>
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
                                <button class="ui right floated button">
                                    <i class="plus icon"></i>
                                    Add New Message
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
    </div>  

    {% include 'layouts/sidebar.volt' %}

{% endblock %}