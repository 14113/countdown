class window.Counter
    constructor: (container)->
        @$container = $(container)
        
        this.createAttributes()
        this.createCouner()
        this.bindEvents()
        
        
    createAttributes: ->
        @id = @$container.data("id")
        @date = @$container.data("date")
        @time = @$container.data("time")
        @name = @$container.data("name")
        @difference = this.difference()

    createCouner: ->
        @$container.find(".data").countdown(
            {startTime:@difference,
            timerEnd: ->
                alert('Start!')
            })
        
        
    bindEvents: ->
        $(".delete").on("click",=>
            @$container.fadeOut()
            console.log "delete!"
            return false
        )
        
    difference: ->
        user_date = @date.split("/");
        user_time = @time.split(":");
        date =new Date();
        date.setYear(user_date[2]);
        date.setMonth(user_date[1]-1, user_date[0]);
        date.setHours(user_time[0], user_time[1], 0, 0);

        date_ms = date.getTime()
        now_ms = new Date().getTime()    
        difference_ms = (date_ms - now_ms)
        if difference_ms<0
            return null


        sec = Math.floor(difference_ms/1000 );
        min = Math.floor(difference_ms/(1000 * 60));
        hours = Math.floor(difference_ms/(1000 * 60 * 60));
        days = Math.floor(difference_ms/(1000 * 60 * 60 * 24));

        this.to_s(days)+":"+this.to_s(hours%24)+":"+this.to_s(min%60)+":"+this.to_s(sec%60); 
    
    to_s: (number) ->
        if number<=0
            return "00";
        else
        if number<10
            return "0"+number
        return number
    
