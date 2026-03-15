import 'package:blablacar/week8/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];
  final int maxAllowedSeats = 8;

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  @override
  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      addPreferenceHistory(preference);
    }
  }

  @override
  void addPreferenceHistory(RidePreference preference) {

    _preferenceHistory.add(preference);
  }
}
