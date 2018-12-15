{% extends 'layouts/base.volt' %}

{% block title %} Welcome - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

<div class="ui two column centered stackable grid customBox">
    {{ form('class' : 'ui form segment') }}

        {% if tipe == 'tourist' %}
            <div class="column">
                <div class="ui icon header">
                    <i class="user circle icon"></i>
                </div>
            </div>
            <h2 class="ui header">Tourist Information</h2>
        {% else %}
            <div class="column">
                <div class="ui icon header">
                    <i class="blind icon"></i>
                </div>
            </div>
            <h2 class="ui header">Guide Information</h2>
        {% endif %}

        {% if tipe == 'tourist' %}
            {{ form.render('tipe', ['value': 'tourist']) }}
        {% else %}
            {{ form.render('tipe', ['value': 'guide']) }}
        {% endif %}

        <div class="field">
            <label>Name</label>
            <div class="two fields">
            <div class="field">
                <label>First Name</label>
                {{ form.render('firstName') }}
            </div>
            <div class="field">
                <label>Last Name</label>
                {{ form.render('lastName') }}
            </div>
            </div>
        </div>

        <div class="field">
        <label>Username</label>
            {{ form.render('username') }}
        </div>

        <div class="field">
            <label>Email</label>
            <input type="email" name="email" placeholder="Email">
        </div>
        
        <div class="field">
            <label>Password</label>
            <div class="two fields">
                <div class="field">
                    {{ form.render('password') }}
                </div>
                <div class="field">
                    {{ form.render('confpassword') }}
                </div>
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

        {{ form.render('go', ['class' : 'ui button']) }}
        
        <div class ='ui column'>
            {% if tipe == 'tourist' %}
                {{ link_to('tourist/login', 'Have an account ? Login Here') }}
            {% else %}
                {{ link_to('guide/login', 'Have an account ? Login Here') }}
            {% endif %}
        </div>

    </form>
</div>

{% endblock %}