import 'package:blablacar/week8/data/dummy_data.dart';
import 'package:blablacar/week8/data/repositories/location/location_repository.dart';
import 'package:blablacar/week8/model/ride/location.dart';

class LocationRepositoryMock implements LocationRepository{
  @override
  Future<List<Location>> availableLocations() async{
    return fakeLocations;
  }
  
}