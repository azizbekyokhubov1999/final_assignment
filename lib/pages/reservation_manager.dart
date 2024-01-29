import 'reservation.dart';

class ReservationManager {
  Map<int, Reservation> _reservations = {};
  int _nextId = 1;

  int createReservation(Reservation reservation) {
    var id = _nextId++;
    _reservations[id] = reservation;
    return id;
  }

  Reservation? getReservation(int id) {
    return _reservations[id];
  }

  void updateReservation(int id, Reservation updatedReservation) {
    if (_reservations.containsKey(id)) {
      _reservations[id] = updatedReservation;
      print("Reservation updated.");
    } else {
      print("Reservation not found.");
    }
  }

  void cancelReservation(int id) {
    if (_reservations.containsKey(id)) {
      _reservations.remove(id);
      print("Reservation cancelled.");
    } else {
      print("Reservation not found.");
    }
  }

  void displayAllReservations() {
    _reservations.forEach((id, reservation) {
      print("ID: $id, $reservation");
    });
  }
}
