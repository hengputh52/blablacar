import 'package:blablacar/week8/model/ride_pref/ride_pref.dart';
import 'package:blablacar/week8/services/ride_prefs_service.dart';
import 'package:blablacar/week8/ui/screens/home/home_view_model/home_view_model.dart';
import 'package:blablacar/week8/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blablacar/week8/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blablacar/week8/ui/theme/theme.dart';
import 'package:blablacar/week8/ui/widgets/picker/bla_ride_preference_picker.dart';
import 'package:blablacar/week8/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(context) {
    return Stack(children: [_buildBackground(), BuildForeground()]);
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}

class BuildForeground extends StatelessWidget {
  const BuildForeground({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel hv = context.watch<HomeViewModel>();
    return Column(
      children: [
        // 1 - THE HEADER
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              BlaRidePreferencePicker(
                initRidePreference: hv.currrentPreference,
                onRidePreferenceSelected: hv.onSelectPreference,
              ),
              SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              BuildHistory(),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildHistory extends StatelessWidget {
  const BuildHistory({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel hv = context.watch<HomeViewModel>();
    // List<RidePreference> history = RidePrefsService.preferenceHistory.reversed
    //     .toList();

    void onRideSelected(RidePreference selectedPreference) async {
      hv.onSelectPreference(selectedPreference);
      await Navigator.of(
        context,
      ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
    }

    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        shrinkWrap: true, // Fix ListView height issue
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: hv.preferenceHistory.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: hv.preferenceHistory[index],
          onPressed: () => onRideSelected(hv.preferenceHistory[index]),
        ),
      ),
    );
  }
}
