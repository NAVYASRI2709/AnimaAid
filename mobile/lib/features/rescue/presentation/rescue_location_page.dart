import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/widgets/app_map.dart';

class RescueLocationPage extends StatefulWidget {
  const RescueLocationPage({super.key});

  @override
  State<RescueLocationPage> createState() => _RescueLocationPageState();
}

class _RescueLocationPageState extends State<RescueLocationPage> {
  LatLng _selectedLocation = const LatLng(13.0827, 80.2707);

  bool _isLoadingLocation = true;
  bool _isUsingCurrentLocation = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

  Future<void> _loadCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        _finishLoadingLocation();
        return;
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _finishLoadingLocation();
        return;
      }

      final position = await Geolocator.getCurrentPosition();

      if (!mounted) {
        return;
      }

      setState(() {
        _selectedLocation = LatLng(
          position.latitude,
          position.longitude,
        );
        _isUsingCurrentLocation = true;
        _isLoadingLocation = false;
      });
    } catch (_) {
      _finishLoadingLocation();
    }
  }

  void _finishLoadingLocation() {
    if (!mounted) {
      return;
    }

    setState(() {
      _isLoadingLocation = false;
    });
  }

  void _selectLocation(
    TapPosition tapPosition,
    LatLng point,
  ) {
    setState(() {
      _selectedLocation = point;
      _isUsingCurrentLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Rescue Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: AppMap(
              initialLocation: _selectedLocation,
              markers: [
                Marker(
                  point: _selectedLocation,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.location_pin,
                    size: 50,
                    color: _isUsingCurrentLocation
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
              onTap: _selectLocation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isLoadingLocation)
                  const Row(
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Finding your current location...'),
                    ],
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        _isUsingCurrentLocation
                            ? Icons.my_location
                            : Icons.location_on_outlined,
                        color: _isUsingCurrentLocation
                            ? Colors.green
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _isUsingCurrentLocation
                              ? 'Using your current location as the default rescue location.'
                              : 'Custom rescue location selected.',
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                Text(
                  'Selected coordinates: '
                  '${_selectedLocation.latitude.toStringAsFixed(4)}, '
                  '${_selectedLocation.longitude.toStringAsFixed(4)}',
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap anywhere on the map to choose a different location.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        _selectedLocation,
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Confirm Location'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}