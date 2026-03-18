import 'package:blablacar/week8/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';
import 'package:flutter/widgets.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository _ridePreferenceRepository;
  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];

  List<RidePreference> get preferenceHistory => _preferenceHistory;

  RidePreferenceState({
    required RidePreferenceRepository ridePreferenceRepository,
  }) : _ridePreferenceRepository = ridePreferenceRepository;

  RidePreference? get selectedPreference => _selectedPreference;

  void onSelectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      _ridePreferenceRepository.selectPreference(preference);
      onAddPreference(preference);
    }
    notifyListeners();
  }

  void onAddPreference(RidePreference preference) {
    _preferenceHistory.add(preference);
    notifyListeners();
  }
}
