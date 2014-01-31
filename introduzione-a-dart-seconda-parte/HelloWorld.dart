import 'dart:html';

num rotatePos = 0;

void main() {
    query("#text")
        ..text = "Click me!"
        ..on.click.add(rotateText);
}

void rotateText(Event event) {
    rotatePos += 360;
    query("#text").style
        ..transition = "1s"
        ..transform = "rotate(${rotatePos}deg)";
}