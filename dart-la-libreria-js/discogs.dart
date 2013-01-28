    import 'dart:html';
    import 'package:js/js.dart' as js;
    
    void main() {
    
      var script = new ScriptElement();
      script.src  = "http://api.discogs.com/database/search?q=Van+Der+Graaf+Generator+Pawn+Hearts&page=1&per_page=5&callback=dartCallback";
      document.body.nodes.add(script);
      
      js.scoped(() {
        js.context.dartCallback = new js.Callback.once(funzioneDart);
      });
    
    }
    
    void funzioneDart(response){
      var data = response.data.results;
      
      for(var i=0; i<data.length; i++){
        print("ID: ${data[i].id}");
        print("Titolo: ${data[i].title}");
        print("URL: http://discogs.com${data[i].uri}\n");
      }
      
    }