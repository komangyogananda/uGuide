{% extends 'layouts/base.volt' %}

{% block title %} Welcome - Tour Guide {% endblock %}

{% block content %}

<div class="ui two column centered grid customBox">
    {{ form('class' : 'ui form segment') }}

        <h2 class="ui header">Guide Information</h2>

        {{ form.render('tipe', ['value': 'guide']) }}

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

    </form>
</div>

{% endblock %}