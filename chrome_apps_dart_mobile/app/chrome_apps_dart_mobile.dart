import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'notification_component.dart';


@MirrorsUsed(targets: const ['notification_component'], override: '*')
import 'dart:mirrors';

class MyAppModule extends Module {
  MyAppModule() {
    type(NotificationComponent);
  }
}



main() {
  applicationFactory()
       .addModule(new MyAppModule())
       .run();
}
