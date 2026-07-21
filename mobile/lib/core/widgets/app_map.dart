import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AppMap extends StatelessWidget {
  const AppMap({
    super.key,
    this.initialLocation = const LatLng(13.0827, 80.2707),
    this.initialZoom = 13,
    this.markers = const [],
    this.onTap,
  });

  final LatLng initialLocation;
  final double initialZoom;
  final List<Marker> markers;
  final void Function(TapPosition, LatLng)? onTap;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialLocation,
        initialZoom: initialZoom,
        onTap: onTap,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.animaaid.mobile',
        ),
        if (markers.isNotEmpty)
          MarkerLayer(
            markers: markers,
          ),
      ],
    );
  }
}