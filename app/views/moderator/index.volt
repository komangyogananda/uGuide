{% extends 'layouts/base.volt' %}

{% block title %} Moderator {% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <div class="item">
            <i class="user icon"></i>
            <span class="text">Moderator</span>
        </div>
        <div class="right menu">
            <div class="item">
                <a href="{{ url('moderator/xxx/yyy/logout')}}">
                    <div class="ui button">
                        Logout
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="ui stackable grid centered">
        <div class="row">
            <div class="ui twelve wide column segment row">
                <h2 class="header">List of non approved payments.</h2>
                    <div class="column center aligned">
                        <table class="ui striped table center aligned">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Trip Id</th>
                                    <th>Amount</th>
                                    <th>Date Expired</th>
                                    <th>Date Payment</th>
                                    <th>Status</th>
                                    <th>Picture</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {% for waiting in pending %}

                                    <tr>
                                        <td>{{ waiting.id }}</td>
                                        <td>{{ waiting.trip_id }}</td>
                                        <td>{{ waiting.amount }}</td>
                                        <td>{{ waiting.date_expired }}</td>
                                        <td>{{ waiting.date_paid }}</td>
                                        <td>{{ waiting.status }}</td>
                                        <td>
                                            <img src="data:image/jpeg;base64,{{ waiting.proof }}">
                                        </td>
                                        <td>
                                            <div class="ui positive button setActive" data-id="{{ waiting.id }}">
                                                Set Active
                                            </div>
                                        </td>
                                    </tr>

                                {% endfor %}

                            </tbody>
                            <!-- <tfoot>
                                <tr><th colspan="8">
                                  <div class="ui right floated pagination menu">
                                    <a class="icon item">
                                      <i class="left chevron icon"></i>
                                    </a>
                                    <a class="item">1</a>
                                    <a class="item">2</a>
                                    <a class="item">3</a>
                                    <a class="item">4</a>
                                    <a class="icon item">
                                      <i class="right chevron icon"></i>
                                    </a>
                                  </div>
                                </th>
                              </tr>
                            </tfoot> -->
                        </table>
                </div>
            </div>
        </div>

        <form method="post">
            <input id="payID" type="hidden" name="payID">
        </form>

        <div class="row">
            <div class="ui twelve wide column segment row">
                <h2 class="header">Others payments.</h2>
                    <div class="column center aligned">
                        <table class="ui striped table center aligned">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Trip Id</th>
                                    <th>Amount</th>
                                    <th>Date Expired</th>
                                    <th>Date Payment</th>
                                    <th>Status</th>
                                    <th>Picture</th>
                                </tr>
                            </thead>
                            <tbody>
                                {% for waiting in other %}

                                    <tr class="{% if waiting.status == 'ACCEPTED' %}positive{% else %}error{% endif %}">
                                        <td>{{ waiting.id }}</td>
                                        <td>{{ waiting.trip_id }}</td>
                                        <td>{{ waiting.amount }}</td>
                                        <td>{{ waiting.date_expired }}</td>
                                        <td>{{ waiting.date_paid }}</td>
                                        <td>{{ waiting.status }}</td>
                                        <td>
                                            <img src="data:image/jpeg;base64,{{ waiting.proof }}">
                                        </td>
                                    </tr>

                                {% endfor %}
                            </tbody>
                            <!-- <tfoot>
                                <tr><th colspan="7">
                                  <div class="ui right floated pagination menu">
                                    <a class="icon item">
                                      <i class="left chevron icon"></i>
                                    </a>
                                    <a class="item">1</a>
                                    <a class="item">2</a>
                                    <a class="item">3</a>
                                    <a class="item">4</a>
                                    <a class="icon item">
                                      <i class="right chevron icon"></i>
                                    </a>
                                  </div>
                                </th>
                              </tr>
                            </tfoot> -->
                        </table>
                </div>
            </div>
        </div>
    </div>

    <script>
    
        $('.setActive').on('click', function(){
            $id = $(this).data('id');
            $('#payID').val($id);
            $('form').submit();
        });
    
    </script>

{% endblock %}