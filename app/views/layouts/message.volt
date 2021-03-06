    <div class="ui small modal">
        <div class="header">Add New Message</div>
        <div class="content">
            {{ form('class' : 'ui form') }}

                <div class="ui field">
                    {{ messageForm.render('title') }}
                </div>

                <div class="ui field">
                    {{ messageForm.render('message') }}
                </div>

                <div class="actions">
                    <input type="hidden" name="activity" value="yes">
                    <input type="hidden" name="trip" value="{{ activeTrip.id }}"> 
                </div>

                <div class="actions">
                    {{ messageForm.render('go', ['class' : 'ui positive button'])}}
                </div> 

            </form>
        </div>
    </div>

    <script>
        $('#addActivity').on("click", function(){
            $('.small.modal').modal('show');
        });
    </script>