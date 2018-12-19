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
    </div>
    

    <div class="ui stackable grid centered">
            <div class="row">
                <div class="ui six wide segment column center aligned">
                    <h2 class="header">List of tourist in your area</h2>
                </div>
            </div>
            <div class="ui two column row">
                {% if trip|length == 0 %}
                    <div class="ui info message">There is no trip available in your area.</div>
                {% else %}
                    {% for tr in trip %}
                    <div class="ui column center aligned">
                        <div class="ui card centered">
                            <div class="image">
                                    <img src="data:image/jpeg;base64,{{ tourist[tr.tourist_id].picture }}">
                            </div>
                            <div class="content">
                                <a class="header">{{ tourist[tr.tourist_id].fname|capitalize ~ ' ' ~ tourist[tr.tourist_id].lname|capitalize }}</a>
                                <div class="meta">
                                    <span class="location">{{ tourist[tr.tourist_id].location|capitalize }}</span>
                                </div>
                                <div class="ui info message">
                                    <h2 class="header">
                                        Trip Info
                                    </h2>
                                    <div class="ui divided list">
                                        <div class="item">
                                            <div class="ui blue horizontal label">Location</div>
                                            <div class="ui teal horizontal label">{{ tr.destination|capitalize }}</div>
                                        </div>
                                        <div class="item">
                                            <div class="ui blue horizontal label">Minimum Budget</div>
                                            <div class="ui teal horizontal label">Rp. {{ tr.min_budget }}</div>
                                        </div>
                                        <div class="item">
                                            <div class="ui blue horizontal label">Maximum Budget</div>
                                            <div class="ui teal horizontal label">Rp. {{ tr.max_budget }}</div>
                                        </div>
                                        <div class="item">
                                            <div class="ui blue horizontal label">Service(s)</div>
                                            <div class="six wide column center aligned">
                                                <div class="item">
                                                {% for sr in service[tr.id] %}
                                                    <div class="ui teal horizontal label">{{ sr.value }}</div>
                                                {% endfor %}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="ui blue horizontal label">Start Date</div>
                                            <div class="ui teal horizontal label">{{ date('D, d-M-Y', strtotime(tr.date)) }}</div>
                                        </div>
                                        <div class="item">                                                
                                            <div class="ui blue horizontal label">Duration</div>
                                            <div class="ui teal horizontal label">{{ tr.duration }} Day(s)</div>
                                        </div>
                                        <div class="item">                                                
                                            <div class="ui blue horizontal label">Person</div>
                                            <div class="ui teal horizontal label">{{ tr.person }} Person(s)</div>                                           
                                        </div>
                                        <div class="item">
                                            <div class="ui blue horizontal label">Description</div>
                                            <div class="six wide column center aligned">
                                                <div>
                                                    <div class="ui teal horizontal label">
                                                            {{ tr.description }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="extra content">
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
                {% endif %}
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