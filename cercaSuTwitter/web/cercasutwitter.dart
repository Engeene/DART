import 'dart:html';
import 'dart:convert';

void main() {
  ButtonElement btn = query("#btn");
  InputElement input = query("#cerca");
  input.value = 'engeene';
  btn.onClick.listen((e){
    cerca(input.value);
  });
  
  cerca("engeene");
}

void cerca(String q){
  if(q!=""){
    String url = "https://search.twitter.com/search.json?q=${q}&rpp=10";
    HttpRequest richiesta = new HttpRequest.getString(url, mostra);
  }
}

void mostra(HttpRequest req) {;
  Map tweets = JSON.decode(req.response)["results"];
  
  DivElement risultati = query("#boxRisultati");
  risultati.innerHtml="";
  
  
  if(tweets.length>0){
  
    for ( var i=0; i<tweets.length; i++){
          
      DivElement divSingoloRisultato = new DivElement();
      divSingoloRisultato.classes.add("tweet");
  
      DivElement testo = new DivElement();
      testo.classes.add("tweet-testo");
      testo.innerHtml = linkify(tweets[i]["text"]);
     
      DivElement autore = new DivElement();
      autore.classes.add("tweet-autore");
      autore.innerHtml = "Da <a target='_blank' href='https://twitter.com/${tweets[i]["from_user"]}'>${tweets[i]["from_user_name"]}</a>, scritto <a target='_blank' href='https://twitter.com/${tweets[i]["from_user"]}/status/${tweets[i]["id_str"]}'>${distanzaNelTempo(tweets[i]["created_at"])}</a>";
      
      divSingoloRisultato.nodes.add(testo);
      divSingoloRisultato.nodes.add(new Element.html("<hr/>"));
      divSingoloRisultato.nodes.add(autore);
      
      risultati.nodes.add(divSingoloRisultato);  
    }
  } else {
    
    DivElement nessunRisultato = new DivElement();
    nessunRisultato.classes.add("nessunRisultato");
    nessunRisultato.text="La ricerca non ha prodotto alcun risultato :-(";
    risultati.nodes.add(nessunRisultato);
    
  }
}

String linkify(String text) {
  List words = text.split(' ');
  var buffer = new StringBuffer();
  for (var word in words) {
    if (!buffer.isEmpty) buffer.write(' ');
    if (word.startsWith('http://') || word.startsWith('https://')) {
      buffer.write('<a target=\'_blank\' href="$word">$word</a>');
    } else {
      buffer.write(word);
    }
  }
  return buffer.toString();
}

String distanzaNelTempo(String twitterTimestamp){
  List<String> elemTimestamp = twitterTimestamp.split(" ");
  
  int anno = int.parse(elemTimestamp[3]);
  int mese = meseDaStringa(elemTimestamp[2]);
  int giorno = int.parse(elemTimestamp[1]);
  List<String> elemOra = elemTimestamp[4].split(":");
  int ora = int.parse(elemOra[0]);
  int minuto = int.parse(elemOra[1]);
  int secondo = int.parse(elemOra[2]);
  
  
  DateTime dataCorrente = new DateTime.now();
  DateTime dataTweet = new DateTime(anno,mese,giorno,ora,minuto,secondo).add(dataCorrente.timeZoneOffset);

  int msPerMinuto = 60 * 1000;
  int msPerOra = msPerMinuto * 60;
  int msPerGiorno = msPerOra * 24;
  int msPerMese = msPerGiorno * 30;
  int msPerAnno = msPerGiorno * 365;
  
  int tempoTrascorso = dataCorrente.difference(dataTweet).inMilliseconds;
  
  int quantita;
  
  if (tempoTrascorso < msPerMinuto) {
    quantita = tempoTrascorso~/1000;
    return "${quantita} second${desinenza(quantita)} fa";   
  }
  
  else if (tempoTrascorso < msPerOra) {
    quantita = tempoTrascorso~/msPerMinuto;
    return "${quantita} minut${desinenza(quantita)} fa";   
  }
  
  else if (tempoTrascorso < msPerGiorno ) {
    quantita = tempoTrascorso~/msPerOra;
    return "${quantita} or${desinenza(quantita,false)} fa";
  }

  else if (tempoTrascorso < msPerMese) {
    quantita = tempoTrascorso~/msPerGiorno;
    return "circa ${quantita} giorn${desinenza(quantita)} fa";   
  }
  
  else if (tempoTrascorso < msPerAnno) {
    quantita = tempoTrascorso~/msPerMese;
    return "circa ${quantita} mes${desinenza(quantita,true,true)} fa";   
  }
  
  else {
    quantita = tempoTrascorso~/msPerAnno;
    return "circa ${quantita} ann${desinenza(quantita)} fa";   
  }

}


int meseDaStringa(String mese){
  Map mappa = {"jan":1,"feb":2,"mar":2,"apr":4,"may":5,"jun":6,"jul":7,"aug":8,"sep":9,"oct":10,"nov":11,"dec":12};
  return mappa[mese.toLowerCase()];
}

String desinenza(int quantita,[bool maschile = true,bool mese=false]){
  if(quantita>1 || quantita==0){
    if(maschile){
      return "i";
    } else {
      return "e";
    }
  } else {
    if(maschile){
      if(mese){
        return "e";
      }
      return "o";
    } else {
      return "a";
    }
  }
}