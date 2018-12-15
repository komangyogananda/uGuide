{% extends 'layouts/base.volt' %}

{% block title %} Find A Guide - {% if tipe == 'tourist' %}Tourist{% else %}Tour Guide{% endif %}{% endblock %}

{% block content %}

    <div class="ui stackable menu">
        <a class="sidebarToggle item">
            <i class="bars icon"></i>
        </a>
        <div class="item">
            <i class="square plus icon"></i>
            <span class="text">Find A Guide</span>
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

    <div class="ui centered stackable grid">
        <div class="row">
            <div class="eight wide column center aligned">

                {{ form('class' : 'ui form segment') }}
                
                    <div class="column center aligned">
                        <h1 class="ui header">
                            <i class="plus square icon"></i>
                        </h1>
                        <h2 class="ui header">
                            Add Holiday
                        </h2>
                    </div>
                    <h4 class="ui dividing header">Holiday Information</h4>
                    <div class="field">
                        <div class="field">
                            <label>Title</label>  

                            {{ form.render('title') }} 

                        </div>
                        <div class="field">
                            <label>Budget</label>
                            <div class="two fields">
                                <div class="field">
                                        <div class="ui left labeled input">
                                            <label for="minAmount" class="ui label">Rp.</label>
                                            
                                            {{ form.render('minBudget') }}

                                            <div class="ui basic label">.00</div>
                                        </div>
                                </div>
                                <div class="field">
                                    <div class="ui Right labeled input">
                                        <label for="maxAmount" class="ui label">Rp.</label>
                                        
                                        {{ form.render('maxBudget') }}

                                        <div class="ui basic label">.00</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>Additional</label>
                        <div class="two fields">
                            <div class="field">
                                {{ form.render('startDate') }}
                            </div>
                            <div class="field">
                                <div class="ui labeled input">
                                    {{ form.render('duration') }}
                                    <div class="ui label">Day(s)</div>
                                </div>
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                {{ form.render('location', [
                                    'id' : 'location',
                                    'class' : 'ui fluid search dropdown'
                                ]) }}
                            </div>
                            <div class="field">
                                <div class="ui labeled input">
                                    {{ form.render('person') }}
                                    <div class="ui label">Person(s)</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                            <label for="desc">Description</label>
                            {{ form.render('desc') }}
                        </div>
                    <h4 class="ui dividing header">Service Specification</h4>
                    <div class="field">
                        
                        {{ form.render('services[]', ['id' : 'services',
                                                    'class' : 'ui fluid search dropdown']) }}

                    </div>
                    
                    {{ form.render('publish', ['class' : 'ui button']) }}

                </form>
            </div>
        </div>

    </div>

    {% include 'layouts/sidebar.volt' %}

    <script>
    
        $('#services').dropdown();

        console.log($("#services").val());

    </script>

{% endblock %}