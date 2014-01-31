import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

// Configurazione
String percorsoOutput = '/percorso/al/report.html';

// Configurazione database
String host = 'localhost';
int port = 8889;
String user = 'root';
String password = '12345';
String db = 'miodb';
String tabella = 'miatabella';

// Preparazione elementi HTML
String html_template;
String thead = "";
String tbody = "";


void main() {

  ConnectionPool pool = new ConnectionPool(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
      max: 5
      );

  pool.query('select * from $tabella').then((risultati) {

    thead=thead.concat("      <tr>\n");
    for(var campo in risultati.fields){
      thead=thead.concat('        <th scope="col">${campo.name.toUpperCase()}</th>\n');

    }
    thead=thead.concat("      </tr>");

    for (var riga in risultati) {
      tbody=tbody.concat("      <tr>\n");
      tbody = tbody.concat("        <td>${riga[0]}</td>\n");
      tbody = tbody.concat("        <td>${riga[1]}</td>\n");
      tbody = tbody.concat("        <td>${riga[2]}</td>\n");
      tbody=tbody.concat("      </tr>\n");
    }

    pool.close();
    generaHtml();
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
  <title>Report $db.$tabella</title>
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