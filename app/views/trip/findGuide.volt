{% extends 'layouts/base.volt' %}

{% block title %} Find A Tourist - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="user circle icon"></i>
            <span class="text">Find A Tourist</span>
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
                <div class="ui six wide segment column center aligned">
                    <h2 class="header">List of tourist in your area</h2>
                </div>
            </div>
            <div class="ui two column eight wide row">
                {% for tr in trip %}
                    <div class="ui column center aligned">
                        <div class="ui card centered">
                            <div class="image">
                                <img src="/images/avatar2/large/kristy.png">
                            </div>
                            <div class="content">
                                <a class="header">{{ tourist[tr.tourist_id].fname|capitalize ~ ' ' ~ tourist[tr.tourist_id].lname|capitalize }}</a>
                                <div class="meta">
                                    <span class="location">{{ tourist[tr.tourist_id].location|capitalize }}</span>
                                </div>
                                <div class="ui star rating" data-rating="5"></div>
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
                                        <div id="{{ tr.id }}" class="ui basic green button buttonInterested" data-trip-id="{{ tr.id }}" data-tourist-id="{{ tr.tourist_id }}">
                                            Interested
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>
    </div>

    <div class="ui small modal">
        <div class="header">Interested ?</div>
        <div class="content">
            {{ form('class' : 'ui form') }}

                <div class="ui field">
                    {{ interestForm.render('budget') }}
                </div>

                <div class="ui field">
                    {{ interestForm.render('desc') }}
                </div>

            </form>
        </div>
        <div class="actions">
            <div class="ui positive button sendButton">Send</div>
        </div>
    </div>

    <script>
        $('.buttonInterested').on("click", function(){
            var trip = $(this).data('tripId');
            var touristId = $(this).data('touristId');
            $('form').data('trip', trip);
            $('form').data('tourist', touristId);
            $('.small.modal').modal('show');
        });

        $('.sendButton').on('click', function(){
            var trip = $('form').data('trip');
            $.ajax({
                url: '{{ url("guide/trip/interested/ajaxPost") }}',
                method: 'POST',
                data: { 'budget' : $('#budget').val(),
                        'desc' : $('#desc').val(),
                        'tripId' : $('form').data('trip'),
                        'touristId' : $('form').data('tourist')
                        },
                success: function(){
                    $('#'+trip).addClass('disabled');
                    console.log(this.data);
                }
            });
        });

    </script>

    {% include 'layouts/sidebar.volt' %}

    <script>
    
        $('#services').dropdown();

        console.log($("#services").val());

    </script>

{% endblock %}