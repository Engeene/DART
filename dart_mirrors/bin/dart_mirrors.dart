import 'dart:mirrors';
import 'dart:async';

class Utente {

  final String nome;
  final String cognome;
  DateTime iscrizione;

  Utente(this.nome, this.cognome);

  void scriviMsg(String msg){
    print("$nome scrive: $msg");
  }

  void chiudiAccount() {
    // . . .
  }

}

void main() {

  InstanceMirror im = reflect(new Utente("Mario","Rossi"));
  Future<InstanceMirror> future = im.invoke('scriviMsg',['ciao!']);
  ClassMirror classe = im.type;
  print(struttura(classe));

}


Map struttura(ClassMirror classe) {

  Map mappa = {};
  mappa["Nome"] = classe.simpleName;
  mappa["Costruttori"] = [];

  classe.constructors.forEach((k,v){
    mappa["Costruttori"].add(v.simpleName);
  });

  mappa["Membri"]={};
  mappa["Membri"]["Metodi"]=[];
  mappa["Membri"]["Variabili"]=[];

  classe.methods.forEach((k,v){
    mappa["Membri"]["Metodi"].add(v.simpleName);
  });

  classe.variables.forEach((k,v){
    mappa["Membri"]["Variabili"].add(v.simpleName);
  });

  return mappa;
}

