{% extends 'layouts/base.volt' %}

{% block title %} Welcome - Tour Guide {% endblock %}

{% block content %}

<div class="ui two column centered grid customBox">
    {{ form('class' : 'ui form segment') }}

        {% if tipe == 'tourist' %}
            <div class="column">
                <div class="ui icon header">
                    <i class="user circle icon"></i>
                </div>
            </div>
            <h2 class="ui header">Tourist Login</h2>
        {% elseif tipe == 'guide' %}
            <div class="column">
                <div class="ui icon header">
                    <i class="blind icon"></i>
                </div>
            </div>
            <h2 class="ui header">Guide Login</h2>
        {% else %}
            <div class="column">
                <div class="ui icon header">
                    <i class="money icon"></i>
                </div>
            </div>
            <h2 class="ui header">Moderator Login</h2>
        {% endif %}

        {% if tipe == 'tourist' %}
            {{ form.render('tipe', ['value': 'tourist']) }}
        {% else %}
            {{ form.render('tipe', ['value': 'guide']) }}
        {% endif %}

        <div class="field">
            <label>Email</label>
            <input type="email" name="email" placeholder="Email">
        </div>
        
        
        <div class="field">
            <label>Password</label>
            {{ form.render('password') }}
        </div>

        <div class="field">
            <div class="ui toggle checkbox">
                {{ form.render('remember') }}
                <label>Remember me 7 days.</label>
            </div>
        </div>

        {{ form.render('go', ['class' : 'ui button']) }}

        <div class="ui column">
            {{ link_to('login/forgotPassword', 'Forgot Password') }}
        </div>
        

    </form>
</div>

{% endblock %}