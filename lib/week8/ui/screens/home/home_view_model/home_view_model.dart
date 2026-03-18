import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';
import 'package:blablacar/week8/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState})
  {
    ridePreferenceState.addListener(notifyListeners);
    _init();
  }

  List<RidePreference> _preferenceHistory = [];
  RidePreference? get currrentPreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory => _preferenceHistory;
  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() {
    _preferenceHistory = ridePreferenceState.preferenceHistory;
    notifyListeners();
  }

  void onSelectPreference(RidePreference preference) =>
      ridePreferenceState.onSelectPreference(preference);
}
