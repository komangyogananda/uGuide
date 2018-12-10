{% extends 'layouts/base.volt' %}

{% block title %} Find A Tourist - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui menu">
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

    <div class="ui grid centered">
            <div class="row">
                <div class="ui six wide segment column center aligned">
                    <h2 class="header">List of tourist in your area</h2>
                </div>
            </div>
            <div class="ui two column eight wide row">
                <div class="ui column center aligned">
                    <div class="ui card centered">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header">Novan</a>
                            <div class="meta">
                                <span class="location">Tangerang</span>
                            </div>
                            <div class="ui star rating" data-rating="5"></div>
                            <div class="description">
                                Siap memandu anda kemanapun. Ahli dalam liburan bersama alam.
                            </div>
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
                                    <div class="ui basic green button buttonInterested">
                                        Interested
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui column center aligned">
                    <div class="ui card centered">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header">Novan</a>
                            <div class="meta">
                                <span class="location">Tangerang</span>
                            </div>
                            <div class="ui star rating" data-rating="5"></div>
                            <div class="description">
                                Siap memandu anda kemanapun. Ahli dalam liburan bersama alam.
                            </div>
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
                                    <div class="ui basic green button buttonInterested">
                                        Interested
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui column center aligned">
                    <div class="ui card centered">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header">Novan</a>
                            <div class="meta">
                                <span class="location">Tangerang</span>
                            </div>
                            <div class="ui star rating" data-rating="5"></div>
                            <div class="description">
                                Siap memandu anda kemanapun. Ahli dalam liburan bersama alam.
                            </div>
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
                                    <div class="ui basic green button buttonInterested">
                                        Interested
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui column center aligned">
                    <div class="ui card centered">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header">Novan</a>
                            <div class="meta">
                                <span class="location">Tangerang</span>
                            </div>
                            <div class="ui star rating" data-rating="5"></div>
                            <div class="description">
                                Siap memandu anda kemanapun. Ahli dalam liburan bersama alam.
                            </div>
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
                                    <div class="ui basic green button buttonInterested">
                                        Interested
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <div class="ui small modal">
        <div class="header">Interested ?</div>
        <div class="content">
            {{ form('class' : 'ui form') }}

                <div class="ui field">
                    {{ interestForm.render('trip') }}
                </div>

                <div class="ui field">
                    {{ interestForm.render('tourist') }}
                </div>

                <div class="ui field">
                    {{ interestForm.render('guide') }}
                </div>

                <div class="ui field">
                    {{ interestForm.render('budget') }}
                </div>

                <div class="ui field">
                    {{ interestForm.render('desc') }}
                </div>

            </form>
        </div>
        <div class="actions">
            <div class="ui positive button">Send</div>
        </div>
    </div>

    <script>
        $('.buttonInterested').on("click", function(){
            $('.small.modal').modal('show');
        });
    </script>

    {% include 'layouts/sidebar.volt' %}

    <script>
    
        $('#services').dropdown();

        console.log($("#services").val());

    </script>

{% endblock %}