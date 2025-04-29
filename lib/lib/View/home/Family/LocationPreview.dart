import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPreview extends StatefulWidget {
  final LatLng location;

  const LocationPreview({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationPreview> createState() => _LocationPreviewState();
}

class _LocationPreviewState extends State<LocationPreview> {
  GoogleMapController? _mapController;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    currentLocation = widget.location;
  }

  @override
  void didUpdateWidget(covariant LocationPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.location != oldWidget.location) {
      currentLocation = widget.location;
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(currentLocation!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: AbsorbPointer(
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 15,
              ),
              markers: {
                Marker(markerId: MarkerId('selected'), position: currentLocation!),
              },
              zoomControlsEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              zoomGesturesEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: false,
              mapToolbarEnabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
