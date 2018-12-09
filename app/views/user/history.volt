{% extends 'layouts/base.volt' %}

{% block title %} History - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="history layout icon"></i>
            <span class="text">History</span>
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
            <div class="eight wide column">
                <div class="ui column attached segment">
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
                <button class="positive fluid ui button">Click here for details.</button>
            </div>
        </div>
        
        <div class="row">
            <div class="eight wide column">
                <div class="ui column attached segment">
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
                <button class="positive fluid ui button">Click here for details.</button>
            </div>
        </div>

        <div class="row">
            <div class="eight wide column">
                <div class="ui column attached segment">
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
                <button class="positive fluid ui button">Click here for details.</button>
            </div>
        </div>
        
    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}