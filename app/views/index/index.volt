{% extends 'layouts/base.volt' %}

{% block title %} Hello {% endblock %}

{% block content %}

<div class="ui two column centered grid customBox">
    <div class="column middle aligned">
            <h2 class="center aligned icon header">
                <img src="{{ url('src/smallLogo.png') }}" height="20%" width="20%">
                <div class="content">
                    uGuide
                    <div class="sub header">Tersesat? Traveloka aja!</div>
                </div>
            </h2>
    </div>
    <div class="ui three column row stackable center aligned grid">
        <div class="ui vertical divider" style="color:white">Atau</div>
        <div class="middle aligned row">
            <div class="column">
                <div class="column">
                    <div class="ui icon header">
                        <i class="user circle icon" style="color:white"></i>
                    </div>
                </div>
                <div class="column">
                    <a href={{ url('tourist') }}>
                        <div class="ui primary button">
                            Guide
                        </div>
                    </a>
                </div>
            </div>
            <div class="column">
                    <div class="column">
                        <div class="ui icon header">
                            <i class="blind icon" style="color:white"></i>
                        </div>
                    </div>
                    <div class="column">
                        <a href={{ url('guide') }}>
                            <div class="ui primary button">
                                Guide
                            </div>
                        </a>
                    </div>
                </div>
        </div>
    </div>
</div>

{% endblock %}