class window.App
    constructor: (container) ->
        
        @$container = $(container)
        @$dialog = $("#newTimerDialog").hide()
        @counters = []
        
        this.createTime()
        this.bindEvents()
        this.createCounters()
        
        
    createCounters: ->
        $.each(@$container.find(".counter"),(i,value)=>
            @counters.push new window.Counter($(value))
        )
        
    addCounter:(value)->
        counter = @$container.find(".counter").last()
        @counters.push new window.Counter(counter)
        location.href = "#"+counter.attr("id")
        this.submit()
        
    submit: ->
        this.time().val("")
        this.name().val("")
        this.date().val("")
        
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
        if @hour < 10
            @hour = "0"+@hour
        if @minutes < 10
            @minutes = "0"+@minutes
        
        
    time:->
        @$dialog.find("#counter_time")
    name:->
        @$dialog.find("#counter_name")
    date:->
        @$dialog.find("#counter_date")
        
        
    bindEvents: ->
        _this = this 
        
        $("#newTimerBtn").on("click",=>
            this.name().focus())
            
        this.time().focus( ->
            self = $(this)
            if self.val()==""
                self.val(_this.hour+":"+_this.minutes)
            )
            
        this.date().focus( ->
            self = $(this)
            if self.val()==""
                self.val(_this.day + "/" + _this.mounth + "/" + _this.year)
            )
            
        setTimeout(=>
            @$dialog.slideDown('inline-block')
            this.name().focus()
        , 1000);

    