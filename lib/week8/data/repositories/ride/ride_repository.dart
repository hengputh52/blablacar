import 'package:blablacar/week8/model/ride/ride.dart';
import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';

abstract class RideRepository {
  Future<List<Ride>> getAllRides();

  Future<List<Ride>> getRidesFor(RidePreference preference);
}
