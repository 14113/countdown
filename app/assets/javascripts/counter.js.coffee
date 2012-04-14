class window.Counter
    constructor: (@$container,@width = 53,@eight=77)->
        @$container.hide()
        this.createAttributes()
        this.createCouner()
        this.bindEvents()
        @$container.delay(300).fadeIn()
        
    createAttributes: ->
        @id = @$container.data("id")
        @date = @$container.data("date")
        @time = @$container.data("time")
        @name = @$container.data("name")
        @difference = this.difference()

    createCouner: ->
        @$container.find(".data").countdown(
            {startTime:@difference,
            digitWidth:@width,
            digitHeight:@height,
            timerEnd: ->
                #alert('Start!')
            })
        
        
    bindEvents: ->
        _this = this
        @$container.find(".delete").on("click",(e)->
            result = confirm("Are you sure?")
            if result
                _this.$container.fadeOut()
                link = $(this).attr("href")
                $.ajax({async:true,url:link,type:'post',data: {"_method":"delete"}})
            false
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
            return "00:00:00:00"


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
    
