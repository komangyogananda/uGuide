{% extends 'layouts/base.volt' %}

{% block title %} Welcome - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

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

    <div class="ui two column centered grid">
        <div class="ui grid two column row">
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
                <div class="ui grid two column row">
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
                                            <i class="phone icon"></i>
                                            Call
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <h3 class="header">Activities</h3>
                        <div class="ui message green">
                            <div class="header">
                                Tourist - Arrival
                            </div>
                            <p>Kita dateng tanggal 20.</p>
                        </div>
                        <div class="ui message blue">
                            <div class="header">
                                Guide - Response Arrival
                            </div>
                            <p>Saya tunggu di bandara.</p>
                        </div>
                        <button class="ui right floated button">
                            <i class="plus icon"></i>
                            Add New Message
                        </button>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="ui segment column middle aligned">
                <div class="column center aligned">
                    <h1 class="ui header">
                    Recent Trip
                    </h 1>
                    <h2 class="ui header">
                        <i class="history layout icon"></i>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="ui segment column middle aligned">
                <div class="column center aligned">
                    <h1 class="ui header">
                    News
                    </h 1>
                    <h2 class="ui header">
                        <i class="newspaper layout icon"></i>
                    </h2>
                </div>
            </div>
        </div>
    </div>

    <div id="sidebarMenu" class="ui left vertical inverted sidebar labeled icon menu">
        <div class="column">
            <img class="image" width=40 src="{{ url('src/smallLogo.png') }}">
        </div>

        <a class="item">
            <i class="home icon"></i>
            Home
        </a>
        <a class="item">
            <i class="plus square icon"></i>
            Find a Guide
        </a>
        <a class="item">
            <i class="history layout icon"></i>
            Recent Trip
        </a>
        <a class="ui item">
            <i class="suitcase icon"></i>
            My Trip
        </a>
        <a class="item">
            <i class="user icon"></i>
            Profile
        </a>
        <a class="item">
            <i class="icon">
                <i class="fas fa-comment-alt"></i>
            </i>
            Feed Back
        </a>
        <a class="item">
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

{% endblock %}