import 'menu.dart';
import 'menu_item.dart';

class Reservation {
  String customerName;
  DateTime date;
  String time;
  int numberOfGuests;
  Menu menu;
  List<MenuItem> mealChoices = [];

  Reservation(this.customerName, this.date, this.time, this.numberOfGuests, this.menu);

  void addMealChoice(String itemName) {
    var item = menu.getItemByName(itemName);
    if (item != null) {
      mealChoices.add(item);
    } else {
      print("Meal not found.");
    }
  }

  @override
  String toString() {
    var mealsString = mealChoices.map((item) => item.name).join(', ');
    return 'Reservation for $customerName on $date at $time for $numberOfGuests guests. Meals: $mealsString';
  }
}
