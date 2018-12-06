<!DOCTYPE html>
<html>

    <head>
        <title>{% block title %}{% endblock %} - uGuide</title>
        {% include 'layouts/header.volt' %}
    </head>

    <body>

        {% block content %} {% endblock %}

    </body>

</html>