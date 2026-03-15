import 'package:blablacar/week8/model/ride/location.dart';

abstract class LocationRepository {
  Future<List<Location>> availableLocations();
}
