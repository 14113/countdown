class window.DB
    constructor: (@table = "countdown")->
        @db = openDatabase('countdown', '1.0', 'Countdown App', 2 * 1024 * 1024)
        
    
    create: ->
        @db.transaction (tx)=>
            tx.executeSql('CREATE TABLE IF NOT EXISTS ' + @table + ' (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, date,time,name)');
    
    insert: (event) ->
        if event.time
            @db.transaction (tx) =>
                st = 'INSERT INTO ' + @table + ' (date,time,name) VALUES ("' + event.date + '","' + event.time + '","' + event.name + '")';
                tx.executeSql(st, [], ->
                    location.reload())
                    
                    
    remove: (id) ->
        @db.transaction (tx) =>
            tx.executeSql('DELETE FROM ' + @table + ' WHERE id="' + id + '"',[],->
                location.reload())
                
                
    drop: ->
        @db.transaction (tx) =>
            tx.executeSql('DROP TABLE ' + @table, [], ->
                location.reload())
            return true
            
    findAll: ->
        @db.transaction (tx) =>
            tx.executeSql("SELECT * FROM " + @table, [], (tx, results)->
                i;
                len = results.rows.length;
                for result in len
                    do (result) ->
                        id = results.rows.item(i).id
                        name = results.rows.item(i).name
                        date = results.rows.item(i).date
                        time = results.rows.item(i).time
                        event = new windoew.Event(id,date,time,name)
                        _this.addDatetime(event, i)
            )
