import 'dart:html';

TextAreaElement log = query('#log');

void main() {
  
  WebSocket ws = new WebSocket('ws://127.0.0.1:4000');
    
  aggiornaLog('Provo a connettermi al server');
  
  ws.onOpen.listen((e) => aggiornaLog("Connesso al server"));
  ws.onClose.listen((e) => aggiornaLog("Disconnesso ${e.reason}"));
  ws.onError.listen((e) => aggiornaLog("Errore"));
  
  ws.onMessage.listen((e){
    aggiornaLog("Messaggio ricevuto dal server:");
    aggiornaLog("> ${e.data}");
  });
  
  InputElement input = query('#input');
  ButtonElement btn = query('#btn');

  btn.onClick.listen((e){
    if(input.value!=""){
      aggiornaLog("Invio messaggio al server:");
      aggiornaLog("< ${input.value}");
      ws.send(input.value);
      input.value="";
    } 
  });
}

void aggiornaLog(String msg){
  log.appendHtml(new DateTime.now().toString());
  log.appendHtml(" - $msg\n");
}