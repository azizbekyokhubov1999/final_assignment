import 'menu_item.dart';

class Menu {
  List<MenuItem> _items = [];

  void displayItems() {
    _items.forEach((item) => print(item));
  }

  void addItem(MenuItem item) {
    _items.add(item);
  }

  MenuItem? getItemByName(String name) {
    try {
      return _items.firstWhere((item) => item.name == name);
    } catch (e) {
      return null;
    }
  }
}
