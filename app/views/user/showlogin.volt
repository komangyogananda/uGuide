{% extends 'layouts/base.volt' %}

{% block title %} Welcome - Tour Guide {% endblock %}

{% block content %}

<div class="ui two column centered stackable grid customBox">
    <div class="row">
        <div class="ui grid centered">
            <div class="column wide row">
                {{flashSession.output()}}
            </div>
        </div>
    </div>
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
        {% elseif tipe == 'guide' %}
            {{ form.render('tipe', ['value': 'guide']) }}
        {% else %}
            {{ form.render('tipe', ['value': 'moderator']) }}
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

    </form>
</div>

{% endblock %}