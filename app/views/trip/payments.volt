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
                            <p>{{ trans.id }}</p>
                            <div class="header">
                                Trip Id
                            </div>
                            <p>{{ trans.trip_id }}</p>
                            <div class="header">
                            {% if trans.amount == NULL %}
                                Find guide first.
                            {% else %}
                                You have to pay Rp. {{ trans.amount }}
                            {% endif %}
                            </div>
                            <p>To 888-888-888 a.n Novan Musaad Bank Mandiri</p>
                        </div>
                        <div class="ui negative message">
                            <div class="header">
                                Your payments will be expired in
                            </div>
                            <p>{{ date('D, d-M-Y', strtotime(trans.date_expired)) }}</p>
                        </div>
                        <div class="ui placeholder segment">
                            <div class="ui icon header">
                                <i class="pdf file outline icon"></i>
                                {% if trans.proof == NULL AND trans.status == 'PENDING' %}
                                    No payment's proof uploaded.
                                {% elseif trans.proof != NULL %}
                                    <div class="ui bordered image">
                                        <img src="data:image/jpeg;base64,{{ trans.picture }}">
                                    </div>
                                {% endif %}
                            </div>
                            {% if tipe == 'tourist' AND trans.status == 'PENDING' %}
                                <div class="ui primary button">
                                    <form method="post" enctype="multipart/form-data">
                                        <input type="file" name="proof" id="proof" type="image">
                                    </form>
                                </div>
                            {% endif %}
                        </div>
                        {% if trans.proof != NULL AND trans.status == 'PENDING' %}
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
                        {% elseif trans.status == 'EXPIRED' %}
                            <div class="ui content">
                                <div class="ui steps">
                                    <div class="step">
                                        <i class="close icon"></i>
                                        <div class="content">
                                            <div class="header">
                                            Payment already expired.
                                            </div>
                                            <p>Sorry!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% elseif trans.status == 'ACCEPTED' %}
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
                        {% else %}
                            <div class="ui content">
                                <div class="ui steps">
                                    <div class="step">
                                        <i class="warning icon"></i>
                                        <div class="content">
                                            <div class="header">
                                            Your payments is not completed
                                            </div>
                                            <p>Please pay and upload your proof payments</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}