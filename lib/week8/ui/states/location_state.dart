import 'package:blablacar/week8/data/repositories/location/location_repository.dart';
import 'package:blablacar/week8/model/ride/location.dart';
import 'package:flutter/material.dart';

class LocationState extends ChangeNotifier {
  final LocationRepository locationRepository;
  List<Location>? _locations;
  String searchText = '';
  LocationState({required this.locationRepository});

  List<Location> get locations => _locations == null ? [] : _locations!;

  void getAllLocation() async {
    _locations = await locationRepository.availableLocations();
    notifyListeners();
  }

  void onSearchChanged(String search) {
    searchText = search;
    notifyListeners();
  }

  List<Location> get filteredLocation {
    if (searchText.length < 2) {
      return [];
    }
    return locations
        .where(
          (location) => location.name.toUpperCase().contains(
            searchText.toUpperCase(),
          ),
        )
        .toList();
  }
}
