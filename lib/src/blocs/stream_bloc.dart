import 'dart:async';

class InProcessData {

  int count = 0;
  StreamController _streamController = new StreamController();
  Stream get dataStream => _streamController.stream;

  void click(){
      count +=1;
      _streamController.sink.add(count);
  }

  void dispose(){
    _streamController.close();
  }
}
