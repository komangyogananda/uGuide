{% extends 'layouts/base.volt' %}

{% block title %} Payments - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="money icon"></i>
            <span class="text">Payments</span>
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
            <div class="eight wide column">
                <div class="row">
                    <div class="ui message">
                        <div class="ui icon header">
                            <i class="credit card icon"></i>
                            <div class="content">Payment Information</div>
                        </div>
                        <div class="ui info message">
                            <div class="header">
                                Payment Id
                            </div>
                            <p>#00001</p>
                            <div class="header">
                                Trip Id
                            </div>
                            <p>#00001</p>
                            <div class="header">
                            You have to pay Rp1000.
                            </div>
                            <p>To 000-000-000 Mandiri</p>
                        </div>
                        <div class="ui negative message">
                            <div class="header">
                                Your payments will be expired in
                            </div>
                            <p>24-DEC-2018</p>
                        </div>
                        <div class="ui placeholder segment">
                            <div class="ui icon header">
                                <i class="pdf file outline icon"></i>
                                No payment's proof uploaded.
                            </div>
                            <div class="ui primary button">Add Payment Proof</div>
                        </div>
                        <div class="ui content">
                            <div class="ui steps">
                                <div class="step">
                                    <i class="notched circle loading icon"></i>
                                    <div class="content">
                                        <div class="header">
                                        Waiting for verification.
                                        </div>
                                        <p>Our team will check your payments as soon as possible.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ui content">
                            <div class="ui steps">
                                <div class="completed step">
                                    <i class="icon"></i>
                                    <div class="content">
                                        <div class="header">
                                        Your verification has been approved.
                                        </div>
                                        <p>Thank you!</p>
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