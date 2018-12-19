{% extends 'layouts/base.volt' %}

{% block title %} Interested Guide - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="user circle icon"></i>
            <span class="text">Interested Guide</span>
        </div>
    </div>

    <div class="ui stackable grid centered">
            <div class="row">
                <div class="ui six wide segment column center aligned">
                    <h2 class="header">List of Interested Guide</h2>
                </div>
            </div>
            <div class="ui two column eight wide row">
                <div class="ui column center aligned">
                    {% if status == true %}
                        <div class="ui info message">This trip already has an active guide.</div>
                    {% elseif interests|length == 0 %}
                        <div class="ui info message">We are Sorry! There is no guide interested with your trip yet.</div>
                    {% else %}
                        {% for interest in interests %}
                            <div class="ui card centered">
                                <div class="image">
                                    <img src="data:image/jpeg;base64,{{ nama[interest.guide_id].picture }}">
                                </div>
                                <div class="content">
                                    <a class="header">{{ nama[interest.guide_id].fname|capitalize ~ ' ' ~ nama[interest.guide_id].lname|capitalize}}</a>
                                    <div class="meta">
                                        <span class="location">{{ nama[interest.guide_id].location|capitalize }}</span>
                                    </div>
                                    <div class="ui star rating guideRating" data-rating="{{ rating[interest.guide_id] }}"></div>
                                    <div class="description">
                                        <div class="item">
                                            <div class="ui blue horizontal label">Budget</div>
                                            <div class="ui teal horizontal label">Rp. {{ interest.budget }}</div>
                                        </div>
                                        <div class="item">
                                            <div class="six wide column center aligned">
                                                <div>
                                                    <div class="ui blue horizontal label">Plan</div>
                                                    <div class="ui teal horizontal label">
                                                        {{ interest.plan }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="extra content">
                                    <a>
                                        <i class="icon">
                                            <i class="fas fa-hiking"></i>
                                        </i>
                                        {{ count[interest.guide_id] }} Feedback(s)
                                    </a>
                                    <div class="ui two buttons">
                                        <div class="button">
                                            <div class="ui basic green button buttonAccept" data-plan="{{ interest.plan }}" data-budget='{{ interest.budget }}' data-guide-id="{{ interest.guide_id }}">
                                                Accept
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                    {% endif %}
                </div>
            </div>
    </div>

    <div class="ui basic modal">
        <div class="ui icon header">
            <i class="blind icon"></i>
            Are you sure want to accept this propose ?
        </div>
        <div class="content">
        </div>
        <div class="actions">
            <form method="post">
                <input id="guideForm" type="hidden" name="guide">
                <input id="budgetForm" type="hidden" name="budget">
                <input id="planForm" type="hidden" name="plan">
                <input type="submit" value="Yes" class="ui green ok inverted button">
            </form>
        </div>
    </div>

    {% include 'layouts/sidebar.volt' %}

    <script>
    
        $('#services').dropdown();

        console.log($("#services").val());

        $('.buttonAccept').on('click', function(){
            $guideId = $(this).data('guideId');
            $budget = $(this).data('budget');
            $plan = $(this).data('plan');
            $('.modal div.content').html('<p>'+$budget+'</p>' + '<p>'+$plan+'</p>')
            $('#guideForm').val($guideId);
            $('#budgetForm').val($budget);
            $('#planForm').val($plan);
            console.log($('form').serialize());
            $('.ui.basic.modal').modal('show');
        });

                                    
        $('.guideRating').rating({
            maxRating: 5
        });

        $('.guideRating').rating('disable');


    </script>

{% endblock %}