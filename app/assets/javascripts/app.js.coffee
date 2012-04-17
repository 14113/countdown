class window.App
    constructor: (container) ->
        
        @$container = $(container)
        @$dialog = $("#newTimerDialog").hide()
        @counters = []
        @time = @$dialog.find("#counter_user_time")
        @name = @$dialog.find("#counter_name")
        @date = @$dialog.find("#counter_user_date")
        
        this.createTime()
        this.bindEvents()
        this.createCounters()
        this.addValidation()
      
    addValidation: ->
        @validator = new window.Validate()
        @validator.validDate(@date)
        @validator.validTime(@time)
        
        
    createCounters: ->
        $.each(@$container.find(".user_counter"),(i,value)=>
            @counters.push new window.Counter($(value))
        )
        
    addCounter:(value)->
        counter = @$container.find(".user_counter").last()
        @counters.push new window.Counter(counter)
        this.submit()
        
        $('body').delay(100).animate({scrollTop: $("section").height()+138}, 800);
        
    submit: ->
        @time.val("")
        @name.val("")
        @date.val("")
        
    createTime: ->
        now = new Date()
        @day = now.getDate()
        @mounth = now.getMonth() + 1
        @year = now.getFullYear()
        @hour = now.getHours()
        @minutes = now.getMinutes()+2
        if @day  < 10
            @day = "0"+@day
        if @mounth < 10
            @mounth = "0"+@mounth
        if @hour < 20
            @hour = "20"
        else
            @hour = "23"
            
            
       
        @minutes = "00"   
  
        
    bindEvents: ->
        _this = this 
        
        $("#new_counter").on("submit",->
            try
                _gaq.push(['_trackPageview',"/counters/create"])
        )
        
        $("#newTimerBtn").on("click",=>
            @name.focus()) 
           
        @time.focus( ->
            self = $(this)
            if self.val()==""
                self.val(_this.hour+":"+_this.minutes)
            )
            
        @date.focus( ->
            self = $(this)
            if self.val()==""
                self.val(_this.day + "/" + _this.mounth + "/" + _this.year)
            )
            
        setTimeout(=>
            @$dialog.slideDown('inline-block')
            @name.focus()
        , 1000);

    