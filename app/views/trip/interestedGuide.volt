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
                    <h2 class="header">List of Interested Guide</h2>
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
                                    <div class="ui basic green button buttonAccept">
                                        Accept
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
                                    <div class="ui basic green button buttonAccept">
                                        Accept
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
                                    <div class="ui basic green button buttonAccept">
                                        Accept
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
                                    <div class="ui basic green button buttonAccept">
                                        Accept
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <div class="ui basic modal">
        <div class="ui icon header">
            <i class="blind icon"></i>
            Are you sure want to accept this propose ?
        </div>
        <div class="content">
            <p>budget</p>
            <p>Desc</p>
        </div>
        <div class="actions">
            <form method="post">
                <input type="hidden" name="accept">
                <input type="submit" value="Yes" class="ui green ok inverted button">
            </form>
        </div>
    </div>

    {% include 'layouts/sidebar.volt' %}

    <script>
    
        $('#services').dropdown();

        console.log($("#services").val());

        $('.buttonAccept').on('click', function(){
            $('.ui.basic.modal').modal('show');
        });

    </script>

{% endblock %}