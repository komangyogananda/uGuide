<div id="sidebarMenu" class="ui left vertical inverted sidebar labeled icon menu">
        <div class="column">
            <img class="image" width=40 src="{{ url('src/smallLogo.png') }}">
        </div>

        {% if tipe == 'tourist' %}<a href="{{url('tourist/dashboard')}}" class="item">
        {% else %} <a href="{{url('guide/dashboard')}}" class="item">
        {% endif %}
            <i class="home icon"></i>
            Home
        </a>

        {% if tipe == 'tourist' %}<a href="{{url('tourist/find')}}" class="item">
        {% else %} <a href="{{url('guide/find')}}" class="item">
        {% endif %}
            <i class="plus square icon"></i>
            {% if tipe == 'tourist' %}
            Find a Guide
            {% else %}
            Find a Tourist
            {% endif %}
        </a>
        
        {% if tipe == 'tourist' %}<a href="{{url('tourist/history')}}" class="item">
        {% else %} <a href="{{url('guide/history')}}" class="item">
        {% endif %}
            <i class="history layout icon"></i>
            Recent Trip
        </a>
        
        {% if tipe == 'tourist' %}<a href="{{url('tourist/active')}}" class="item">
        {% else %} <a href="{{url('guide/active')}}" class="item">
        {% endif %}
            <i class="suitcase icon"></i>
            My Trip
        </a>

        {% if tipe == 'tourist' %}<a href="{{url('tourist/profile')}}" class="item">
        {% else %} <a href="{{url('guide/profile')}}" class="item">
        {% endif %}
            <i class="user icon"></i>
            Profile
        </a>
        {% if tipe == 'tourist' %}<a href="{{url('tourist/feedback')}}" class="item">
        {% else %} <a href="{{url('guide/feedback')}}" class="item">
        {% endif %}
            <i class="icon">
                <i class="fas fa-comment-alt"></i>
            </i>
            Feed Back
        </a>

        {% if tipe == 'tourist' %}<a href="{{url('tourist/logout')}}" class="item">
        {% else %} <a href="{{url('guide/logout')}}" class="item">
        {% endif %}
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