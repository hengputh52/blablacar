import 'package:blablacar/services/rides_service.dart';
import 'package:blablacar/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _textController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onClear() {
    _textController.clear();
    _query = "";
  }

  void onChnaged(String value) {
    setState(() {
      _query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _textController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            suffixIcon: _query.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: Colors.grey[500]),
                    onPressed: onClear,
                  )
                : null,
          ),
          onChanged: onChnaged,
        ),
      ),
      body: ListView.separated(
        itemCount: RidesService.availableRides.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text('$index'));
        },
        separatorBuilder: (context, index) {
          return BlaDivider();
        },
      ),
    );
  }
}
