library notification_component;

import 'package:angular/angular.dart';
import 'package:chrome/chrome_app.dart' as chrome;

@NgComponent(
    selector: 'notification',
    templateUrl: 'notification_component.html',
    publishAs: 'cmp'
)
class NotificationComponent {
  String message;
  
  void send() {
    var opts = new chrome.NotificationOptions();
    opts.type = chrome.TemplateType.BASIC;
    opts.title = "Hello";
    opts.iconUrl = "dart_icon.png";
    opts.message = message;
    chrome.notifications.create("id", opts).then((_){
      message = '';
    });
  }
}

main() {}