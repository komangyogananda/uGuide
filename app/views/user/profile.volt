{% extends 'layouts/base.volt' %}

{% block title %} Profile - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="user icon"></i>
            <span class="text">Profile</span>
        </div>
    </div>

    <div class="ui two column centered stackable grid">
        <div class="row">
            <div class="ui segment column middle aligned">
                <div class="column center aligned">
                    <h1 class="ui header">
                        <i class="user icon"></i>
                    </h1>
                    <h2 class="ui header">
                        Profile Information
                    </h2>
                </div>
                <div class="ui stackable grid centered">
                    <div class="two column row center aligned">
                        <div class="column center aligned">
                                {{ form('class' : 'ui form segment') }}

                                <div class="ui medium bordered image">
                                    <img src="https://www.gettyimages.ca/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg">
                                </div>

                                {% if tipe == 'tourist' %}
                                    <div class="field">
                                    <label>Username</label>
                                        {{ form.render('username', ['disabled': true, 
                                                                    'value': 'tourist123',
                                                                    'enctype': 'multipart/form-data']) }}
                                    </div>
                                {% endif %}
    
                                {% if tipe == 'tourist' %}
                                    {{ form.render('tipe', ['value': 'tourist']) }}
                                {% else %}
                                    {{ form.render('tipe', ['value': 'guide']) }}
                                {% endif %}
                                <div class="field">
                                    <label>First Name</label>
                                    {{ form.render('firstName') }}
                                </div>
                                <div class="field">
                                    <label>Last Name</label>
                                    {{ form.render('lastName') }}
                                </div>
                        
                                <div class="field">
                                    <label>Email</label>
                                    <input type="email" name="email" placeholder="Email">
                                </div>
                                
                                <div class="field">
                                    <label>New Password</label>
                                    <div class="field">
                                        {{ form.render('password', ['placeholder' : 'New Password']) }}
                                    </div>
                                    <div class="field">
                                        {{ form.render('confpassword', ['placeholder' : 'New Password Confirmation']) }}
                                    </div>
                                </div>
                        
                                <div class="field">
                                    <div class="two fields">
                                        <div class="field">
                                            <label>Phone number</label>
                                            {{ form.render('telephone') }}
                                        </div>
                                        <div class="field">
                                            <label>Gender</label>
                                            {{ form.render('gender') }}
                                        </div>
                                    </div>
                                </div>
                        
                                <div class="field">
                                    <label>Location</label>
                        
                                    <div class="field">
                                        {{ form.render('location', ['class' : 'ui fluid search dropdown']) }}
                                    </div>
                                </div>
                        
                                <div class="field">
                                    <label>Profile Picture</label>
                                    {{ form.render('picture') }}
                                </div>
    
                                <div class="field">
                                    <label>Current Password</label>
                                    <div class="field">
                                        {{ form.render('password', ['placeholder' : 'Current Password']) }}
                                    </div>
                                </div>
    
                            </form>

                            <div class="row">
                                    <input class="ui button" type="submit" value="Edit">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    {% include 'layouts/sidebar.volt' %}

{% endblock %}