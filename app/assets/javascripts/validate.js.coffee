class window.Validate

    constructor: () ->
        @valid = true
        @valid_name = $("#newTimerDialog #valid_name")
        @valid_date = $("#newTimerDialog #valid_date")
        @valid_time = $("#newTimerDialog #valid_time")
        @date = new Date()
    
    validTime: (elem) ->
        elem.on("keyup", =>
            val = elem.val().split(":")
            if val[0] < 0 || val[0] > 23 || val[1] < 0 || val[1] > 59
                @valid_time.text("Time ar not valid")
            else
                @valid_time.text("")
        )
        
        
    
    validDate: (elem) ->
        elem.on("keyup", =>
            val = elem.val()
           
            arr = val.split("/")
            myDayStr = parseInt arr[0]
            myMonthStr = parseInt arr[1] - 1
            myYearStr = arr[2]
            myMonth = new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'); 
            myDateStr = myDayStr + ' ' + myMonth[myMonthStr] + ' ' + myYearStr;

            myDate = new Date();
            myDate.setFullYear( myYearStr, myMonthStr, myDayStr );
            now = new Date()
            now.setHours(0)
            now.setMinutes(0)
            if val==""
                @valid_date.text("Event can not be blank")
            else if myDate.getMonth() != myMonthStr
                @valid_date.text("Event can not be in invalid format (DD/MM/YYYY)")
            else if myDate < now
                @valid_date.text("Event can not in past")
            else
                @valid_date.text("")
        )
        
        