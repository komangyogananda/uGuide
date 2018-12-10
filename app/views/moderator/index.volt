{% extends 'layouts/base.volt' %}

{% block title %} Moderator {% endblock %}

{% block content %}

    <div class="ui menu">
        <div class="item">
            <i class="user icon"></i>
            <span class="text">Moderator</span>
        </div>
    </div>

    <div class="ui grid centered">
        <div class="row">
            <div class="ui twelve wide column segment row">
                <h2 class="header">List of non approved payments.</h2>
                    <div class="column center aligned">
                        <table class="ui striped table center aligned">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Trip Id</th>
                                    <th>Tourist Id</th>
                                    <th>Guide Id</th>
                                    <th>Amount</th>
                                    <th>Date Expired</th>
                                    <th>Date Payment</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>001</td>
                                    <td>001</td>
                                    <td>002</td>
                                    <td>5000000</td>
                                    <td>24/12/2018</td>
                                    <td>23/12/2018</td>
                                    <td>Not Expired</td>
                                    <td>
                                        <div class="ui positive button">
                                            Set Active
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>003</td>
                                    <td>003</td>
                                    <td>003</td>
                                    <td>004</td>
                                    <td>5000000</td>
                                    <td>24/12/2018</td>
                                    <td>23/12/2018</td>
                                    <td>Not Expired</td>
                                    <td>
                                        <div class="ui positive button">
                                            Set Active
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="ui twelve wide column segment row">
                <h2 class="header">Others payments.</h2>
                    <div class="column center aligned">
                        <table class="ui striped table center aligned">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Trip Id</th>
                                    <th>Tourist Id</th>
                                    <th>Guide Id</th>
                                    <th>Amount</th>
                                    <th>Date Expired</th>
                                    <th>Date Payment</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>001</td>
                                    <td>001</td>
                                    <td>002</td>
                                    <td>5000000</td>
                                    <td>24/12/2018</td>
                                    <td>23/12/2018</td>
                                    <td>Expired</td>
                                </tr>
                                <tr>
                                    <td>003</td>
                                    <td>003</td>
                                    <td>003</td>
                                    <td>004</td>
                                    <td>5000000</td>
                                    <td>24/12/2018</td>
                                    <td>23/12/2018</td>
                                    <td>Active</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>

{% endblock %}