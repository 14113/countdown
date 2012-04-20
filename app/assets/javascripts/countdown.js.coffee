###
  jquery-counter plugin
 
  Copyright (c) 2009 Martin Conte Mac Donell <Reflejo@gmail.com>
  Dual licensed under the MIT and GPL licenses.
  http://docs.jquery.com/License
  
  + update to coffeScript
###
jQuery ->
    $.fn.countdown =(userOptions) ->
        options = {
            stepTime: 60,
            format: "dd:hh:mm:ss",
            startTime: "01:12:32:55",
            digitImages: 6,
            digitWidth: 53,
            digitHeight: 77,
            timerEnd: -> ,
            image: "/assets/digits.png"
        }
        digits = []
        interval = null
        
        $.extend(options, userOptions);
        this.css({
            height: options.digitHeight, 
            overflow: 'hidden'
        });
        
        createDigits = (where) ->
            c = 0
            i = 0
            while i < options.startTime.length
                if parseInt(options.startTime[i]) >= 0
                    elem = $("<div id=\"cnt_" + i + "\" class=\"cntDigit\" />").css(
                        height: options.digitHeight * options.digitImages * 10
                        float: "left"
                        background: "url('" + options.image + "')"
                        width: options.digitWidth
                    )
                    digits.push elem
                    margin c, -(parseInt(options.startTime[i]) * options.digitHeight * options.digitImages)
                    digits[c].__max = 9
                    console.log options.format[i]
                    switch options.format[i]
                        when "h"
                            digits[c].__max = (if (c % 2 is 0) then 2 else 9)
                            digits[c].__condmax = 4  if c % 2 is 0
                        when "d"
                            digits[c].__max = 9
                        when "m", "s"
                            digits[c].__max = (if (c % 2 is 0) then 5 else 5)
                    ++c
                else
                    elem = $("<div class=\"cntSeparator\"/>").css(float: "left").text(options.startTime[i])
                where.append elem
                i++
                
        margin= (elem, val) ->
            if (val != undefined)
                return digits[elem].css({'marginTop': val + 'px'});
            return parseInt(digits[elem].css('marginTop').replace('px', ''));
            
            
        moveStep= (elem) ->
            digits[elem]._digitInitial = -(digits[elem].__max * options.digitHeight * options.digitImages)
            _move = ->
                mtop = margin(elem) + options.digitHeight
                if (mtop == options.digitHeight)
                    margin(elem, digits[elem]._digitInitial);
                    
                    if (elem > 0) 
                        moveStep(elem - 1)();
                    else 
                        clearInterval(interval);
                        margin(elem,0)
                        margin(elem+1,0)
                        margin(elem+2,0)
                        margin(elem+3,0)
                        margin(elem+4,0)
                        margin(elem+5,0)
                        margin(elem+6,0)
                        margin(elem+7,0)
                            
                        #for (i=0; i < digits.length; i++)margin(i, 0);
                        options.timerEnd();
                        #return

                    if ((elem > 0) && (digits[elem].__condmax != `undefined`) && (digits[elem - 1]._digitInitial == margin(elem - 1)))
                        margin(elem, -(digits[elem].__condmax * options.digitHeight * options.digitImages));
                    return
                   
                margin(elem, mtop)
                if (margin(elem) / options.digitHeight % options.digitImages != 0)
                    setTimeout(_move, options.stepTime);

                if (mtop == 0)
                    digits[elem].__ismax = true;   
                   
                

        
        createDigits(this);
        interval = setInterval(moveStep(digits.length - 1), 1000);