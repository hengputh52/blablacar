import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  void selectPreference(RidePreference preference);

  void addPreferenceHistory(RidePreference preference);
}
