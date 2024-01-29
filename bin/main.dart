import 'dart:io';

import 'package:final_assignment/pages/menu.dart';
import 'package:final_assignment/pages/menu_item.dart';
import 'package:final_assignment/pages/reservation.dart';
import 'package:final_assignment/pages/reservation_manager.dart';

void main() {
  var menu = Menu();
  var reservationManager = ReservationManager();

  while (true) {
    print("\nRestaurant Reservation System");
    print("1. View Meal Menu");
    print("2. Add Meal to Menu");
    print("3. Make a Reservation");
    print("4. View All Reservations");
    print("5. Update a Reservation");
    print("6. Cancel a Reservation");
    print("7. Exit");
    stdout.write("Enter your choice: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        viewMealMenu(menu);
        break;
      case '2':
        addMealToMenu(menu);
        break;
      case '3':
        makeReservation(menu, reservationManager);
        break;
      case '4':
        reservationManager.displayAllReservations();
        break;
      case '5':
        updateReservation(reservationManager, menu);
        break;
      case '6':
        cancelReservation(reservationManager);
        break;
      case '7':
        return;
      default:
        print("Invalid choice, please try again.");
    }
  }
}
void addMealToMenu(Menu menu) {
  stdout.write("Enter meal name: ");
  var name = stdin.readLineSync();
  stdout.write("Enter price: ");
  var price = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Enter description: ");
  var description = stdin.readLineSync();
  stdout.write("Enter ingredients (comma separated): ");
  var ingredients = stdin.readLineSync()?.split(',') ?? [];

  var menuItem = MenuItem(name!, price, description!, ingredients);
  menu.addItem(menuItem);
  print("Meal added successfully.");
}

void viewMealMenu(Menu menu) {
  print("\nCurrent Meal Menu:");
  menu.displayItems();
}
// Menu createSampleMenu() {
//   Menu menu = Menu();
//   menu.addItem(MenuItem("Pasta", 12.99, "Delicious Italian pasta.", ["Pasta", "Tomato Sauce", "Cheese"]));
//   menu.addItem(MenuItem("Burger", 9.99, "Classic beef burger with cheese.", ["Bun", "Beef Patty", "Cheese"]));
//   return menu;
// }



void makeReservation(Menu menu, ReservationManager reservationManager) {
  stdout.write("Enter customer name: ");
  String? customerName = stdin.readLineSync();
  stdout.write("Enter date (yyyy-mm-dd): ");
  String? dateString = stdin.readLineSync();
  stdout.write("Enter time (HH:mm): ");
  String? time = stdin.readLineSync();
  stdout.write("Enter number of guests: ");
  String? guestCountString = stdin.readLineSync();

  if (customerName == null || dateString == null || time == null || guestCountString == null) {
    print("Invalid input. Reservation not created.");
    return;
  }

  DateTime date;
  int guestCount;
  try {
    date = DateTime.parse(dateString);
    guestCount = int.parse(guestCountString);
  } catch (e) {
    print("Invalid date or guest count.");
    return;
  }

  var reservation = Reservation(customerName!, date, time, guestCount, menu);

  print("\nAvailable Meals:");
  menu.displayItems();
  while (true) {
    stdout.write("Choose a meal from the menu (or enter 'done'): ");
    var mealChoice = stdin.readLineSync();
    if (mealChoice == 'done' || mealChoice == null) break;
    reservation.addMealChoice(mealChoice);
  }
  int id = reservationManager.createReservation(reservation);
  print("Reservation created with ID: $id");
}

void updateReservation(ReservationManager reservationManager, Menu menu) {
  stdout.write("Enter reservation ID to update: ");
  var idString = stdin.readLineSync();
  if (idString == null || idString.isEmpty) {
    print("Invalid ID.");
    return;
  }
  int id = int.parse(idString);
  var reservation = reservationManager.getReservation(id);
  if (reservation == null) {
    print("Reservation not found.");
    return;
  }

  print("Current Reservation: $reservation");

  reservation.mealChoices.clear();
  menu.displayItems();
  while (true) {
    stdout.write("Choose a meal to add (or enter 'done'): ");
    var mealChoice = stdin.readLineSync();
    if (mealChoice == 'done' || mealChoice == null) break;
    reservation.addMealChoice(mealChoice);
  }
  reservationManager.updateReservation(id, reservation);
  print("Reservation updated.");
}

void cancelReservation(ReservationManager reservationManager) {
  stdout.write("Enter reservation ID to cancel: ");
  var idString = stdin.readLineSync();
  if (idString == null || idString.isEmpty) {
    print("Invalid ID.");
    return;
  }
  int id = int.parse(idString);
  reservationManager.cancelReservation(id);
  print("Reservation cancelled.");
}
