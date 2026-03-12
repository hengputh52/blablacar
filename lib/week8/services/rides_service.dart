
import 'package:blablacar/week8/data/dummy_data.dart';
import 'package:blablacar/week8/model/ride/ride.dart';
import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePreference preferences) {
    return allRides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}
