import 'package:blablacar/week8/data/dummy_data.dart';
import 'package:blablacar/week8/data/repositories/ride/ride_repository.dart';
import 'package:blablacar/week8/model/ride/ride.dart';
import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  @override
  Future<List<Ride>> getAllRides() async {
    return fakeRides;
  }

  @override
  Future<List<Ride>> getRidesFor(RidePreference preference) async {
    return fakeRides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }
}
