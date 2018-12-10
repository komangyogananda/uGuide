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

            </form>
        </div>
        <div class="actions">
            <div class="ui positive button">Send</div>
        </div>
    </div>

    <script>
        $('#addActivity').on("click", function(){
            console.log("coi");
            $('.small.modal').modal('show');
        });
    </script>