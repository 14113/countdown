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
            @counters.push new window.Counter(value)
        )
        
    createTime: ->
        now = new Date()
        @day = now.getDate()
        @mounth = now.getMonth() + 1
        @year = now.getFullYear()
        @hour = now.getHours()
        @minutes = now.getMinutes()+2
        
    bindEvents: ->
        _this = this
        
        $("#newTimerBtn").on("click",=>
            @$dialog.find("#name").focus())
            
        @$dialog.find("#time").focus( ->
            $(this).val(_this.hour+":"+_this.minutes))
            
        @$dialog.find("#date").focus( ->
            $(this).val(_this.day + "/" + _this.mounth + "/" + _this.year))
            
        setTimeout(=>
            @$dialog.slideDown('inline-block');
        , 1000);

    