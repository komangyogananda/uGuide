{% extends 'layouts/base.volt' %}

{% block title %} Recent - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="history layout icon"></i>
            <span class="text">Recent</span>
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
        <div class="two column row">
            <div class="row center aligned">
                <div class="ui column segment">
                    <div class="item">
                        <div class="ui small image">
                            <img src="/images/wireframe/image.png">
                        </div>
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
            </div>
            <div class="row center aligned">
                <div class="ui column segment">
                    <div class="item">
                        <div class="ui small image">
                            <img src="/images/wireframe/image.png">
                        </div>
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
            </div>
        </div>
    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}