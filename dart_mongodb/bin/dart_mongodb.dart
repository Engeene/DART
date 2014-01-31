import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';

// Configurazione
String percorsoOutput = '/percorso/a/report.html';

// Configurazione database
String host = 'localhost';
String database = 'miodb';
String collezione = 'utenti';

// Preparazione elementi HTML
String html_template;
String tbody = "";
String thead = """
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NOME</th>
      <th scope="col">EMAIL</th>
    </tr>""";


void main() {

  Db db = new Db("mongodb://$host/$database");
  db.open()
  .then((e){
    db.collection(collezione).find().toList()
    .then((risultati){
      for(var i=0; i<risultati.length;i++){
        tbody=tbody.concat("      <tr>\n");
        tbody = tbody.concat("        <td>${risultati[i]["id"]}</td>\n");
        tbody = tbody.concat("        <td>${risultati[i]["nome"]}</td>\n");
        tbody = tbody.concat("        <td>${risultati[i]["email"]}</td>\n");
        tbody=tbody.concat("      </tr>\n");
      }
    })
    .then((_){
      generaHtml();
      db.close();
    });
  });

}

generaHtml() {
  html_template="""
<!DOCTYPE html>
<html>
<style>
  table {
    width: 100%;
    padding:10px;
  }

  thead {
    background-color: rgba(0, 255, 0, 0.1);  
  }

  tbody tr:nth-child(odd) {
    background-color: rgba(0, 200, 255, 0.1);
  }
</style>
<head>
  <title>Report $database.$collezione</title>
</head>
<body>
  <table>
    <thead>
$thead
    </thead>
    <tbody>
$tbody
    </tbody>
  </table>
</body>
</html>
 """;

  File output = new File(percorsoOutput);
  output.writeAsStringSync(html_template);
}