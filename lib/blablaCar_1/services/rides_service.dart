import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  static List<Ride> filterByDeparture(Location departure) {
    return availableRides
        .where((avaiableRide) =>
            avaiableRide.departureLocation.name == departure.name,
        )
        .toList();
  }

  static List<Ride> filterBySeatRequested(int seatRequest) {
    return availableRides
        .where((seat) => seat.remainingSeats >= seatRequest)
        .toList();
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {

    return availableRides
    .where((filter) => (filter.departureLocation.name == departure!.name) && (filter.remainingSeats >= seatRequested!))
    .toList();
  }
}
