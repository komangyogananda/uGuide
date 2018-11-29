<!DOCTYPE html>
<html>

    <head>
        {% include 'layouts/header.volt' %}
        <title>{% block title %}{% endblock %} - uGuide</title>
    </head>

    <body>

        {% block content %} {% endblock %}

        {% include 'layouts/footer.volt' %}
    </body>

</html>