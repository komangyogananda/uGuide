{% extends 'layouts/base.volt' %}

{% block title %} Welcome - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui centered grid">
        <div class="left aligned column">
            <div class="ui compact menu sidebarToggle">
                <a class="active item">
                    <i class="bars icon"></i>
                </a>
            </div>        
        </div>
        <div class="centered aligned column">
            <img class="ui fluid image" src="{{ url('src/bigLogo.png') }}">
        </div>
        <div class="right aligned column">
            <div class="ui compact menu">
                <a class="item">
                    <i class="arrow alternate circle right icon"></i>
                    Logout
                </a>
            </div> 
        </div>
    </div>


    <div id="sidebarMenu" class="ui left vertical inverted sidebar labeled icon menu">
        <img class="image" src="{{ url('src/smallLogo.png') }}" width="10%" height="auto">
        <a class="item">
            <i class="home icon"></i>
            Home
        </a>
        <a class="item">
            <i class="history layout icon"></i>
            History
        </a>
        <a class="item">
            <i class="suitcase icon"></i>
            Active
        </a>
        <a class="item">
            <i class="user icon"></i>
            Profile
        </a>
        <a class="bottom item sidebarToggle">
            <i class="angle double left icon"></i>
        </a>
    </div>

    <script>    
        $(".sidebarToggle").on("click", function(){
            $("#sidebarMenu").sidebar('toggle');
        });
    </script>

{% endblock %}