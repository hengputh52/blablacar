import 'package:blablacar/ui/screens/ride_pref/widgets/bla_button.dart';
import 'package:blablacar/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats = 1;


  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO

    departureDate =  DateTime.now();
    requestedSeats =  1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSwitchLocation() {
    setState(() {
      final Location? temp = departure;
      departure = arrival;
      arrival = temp;

    
    });
  }
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.circle),
                    title: Text(departure?.name ?? 'Select departure'),
                    onTap: () {},
                  ),
                ),
                IconButton(
                  onPressed: onSwitchLocation,
                  icon: Icon(Icons.swap_vert),
                ),
              ],
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.circle),
              title: Text(arrival?.name ?? 'Select arrival'),
              onTap: () {},
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(DateTimeUtils.formatDateTime(DateTime.now())),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: Text('$requestedSeats'),
              onTap: () {},
            ),

            BlaButton.primary(label: "Search"),
          ],
        ),
      ],
    );
  }
}
