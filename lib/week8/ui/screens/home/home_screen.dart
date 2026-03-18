
import 'package:blablacar/week8/ui/screens/home/home_view_model/home_view_model.dart';
import 'package:blablacar/week8/ui/screens/home/widgets/home_content.dart';

import 'package:blablacar/week8/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(ridePreferenceState: context.read<RidePreferenceState>()),
          child: HomeContent(),
    );
  }
}
