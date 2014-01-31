import 'package:angular/angular.dart';
import 'notification_component.dart';

@MirrorsUsed(targets: const ['notification_component'], override: '*')
import 'dart:mirrors';

main() {
  ngBootstrap(module: new Module()..type(NotificationComponent));
}