{% extends 'layouts/base.volt' %}

{% block title %} Hello {% endblock %}

{% block content %}

<div class="ui two column centered stackable grid customBox">
    <div class="column middle aligned">
            <h1 class="center aligned icon header">
                <img src="{{ url('src/smallLogo.png') }}" height="20%" width="20%">
                <h1 class="ui icon header inverted">
                    <i class="icon">
                        <i class="fas fa-sad-tear"></i>
                    </i>
                    <div class="content">
                        Not Found
                        <div class="sub header">Page that you looking for is not available.</div>
                    </div>
                </h1>
            </h1>
    </div>
</div>

{% endblock %}