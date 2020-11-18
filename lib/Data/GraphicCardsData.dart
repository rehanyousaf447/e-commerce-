import 'package:flutter/widgets.dart';
import 'package:gwbhai/Widgets/Card.dart';

class GraphicCardLists extends ChangeNotifier {
  static String myclassName='GRAPHIC CARDS';
  List<Mycard> myCard = [];

  void addTask(String image, String details, String rupees) {
    myCard.add(Mycard(
      image: image,
      details: details,
      price: rupees,
    ));
    notifyListeners();
  }

  void addcard(Mycard mycard) {
    this.myCard.add(mycard);
  }

  void deleteCard(Mycard mycard) {
    this.myCard.remove(mycard);
    notifyListeners();
  }

  void deleteTask(Mycard mycard) {
    myCard.remove(mycard);
    notifyListeners();
  }
}
