<div id="sidebarMenu" class="ui left vertical inverted sidebar labeled icon stackable menu">
        <div class="column">
            <img class="image" width=40 src="{{ url('src/smallLogo.png') }}">
        </div>

        <a href="{{ url(tipe ~ '/dashboard') }}" class="item">
            <i class="home icon"></i>
            Home
        </a>

        <a href="{{ url(tipe ~ '/find') }}" class="item">
            <i class="plus square icon"></i>
            {% if tipe == 'tourist' %}
            Find a Guide
            {% else %}
            Find a Tourist
            {% endif %}
        </a>
        
        <a href="{{ url(tipe ~ '/history') }}" class="item">
            <i class="history layout icon"></i>
            Recent Trip
        </a>
        
        <a href="{{ url(tipe ~ '/active') }}" class="item">
            <i class="suitcase icon"></i>
            My Trip
        </a>

        <a href="{{ url(tipe ~ '/profile/edit') }}" class="item">
            <i class="user icon"></i>
            Profile
        </a>

        <a href="{{ url(tipe ~ '/logout') }}" class="item">
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