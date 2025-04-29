import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../Component/app_colors.dart';
import '../../../Services/API.dart';

import '../../../Controller/familyController.dart';

class SelectLocationPage extends StatefulWidget {
  SelectLocationPage({required this.isOrigin});
  final bool isOrigin;
  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  GoogleMapController? _mapController;
  final Familycontroller controller = Get.put(Familycontroller());

  LatLng _initialPosition = LatLng(33.5138, 36.2765); // موقع مبدئي (دمشق مثلاً)

  Future<void> _goToCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        16,
      ),
    );

    setState(() {
      controller.selectedLocation = LatLng(
        position.latitude,
        position.longitude,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختر موقعك")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (LatLng latLng) {
              setState(() {
                controller.selectedLocation = latLng;
              });
            },
            markers:
                controller.selectedLocation != null
                    ? {
                      Marker(
                        markerId: MarkerId("selected"),
                        position: controller.selectedLocation!,
                      ),
                    }
                    : {},
          ),

          // 🔘 زر تحديد الموقع
          Positioned(
            bottom: 120,
            right: 16,
            child: FloatingActionButton(
              onPressed: _goToCurrentLocation,
              child: Icon(Icons.my_location, color: AppColors.white),
              backgroundColor: AppColors.primary,
            ),
          ),

          // ✅ زر تأكيد الموقع
          if (controller.selectedLocation != null)
            Obx(
              () => Positioned(
                bottom: 100,
                left: 16,
                //right: 16,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed:
                      controller.getAddress.value
                          ? () async {
                            controller.getAddress(false);
                            if (widget.isOrigin == true) {
                              controller.originalAddress.value.text = await API
                                  .getPlaceFromCoordinates(
                                    controller.selectedLocation!.latitude,
                                    controller.selectedLocation!.longitude,
                                  );

                              controller.originalGpsX =
                                  controller.selectedLocation?.latitude;
                              controller.originalGpsY =
                                  controller.selectedLocation?.longitude;
                            } else {
                              controller.currentAddress.value.text = await API
                                  .getPlaceFromCoordinates(
                                    controller.selectedLocation!.latitude,
                                    controller.selectedLocation!.longitude,
                                  );

                              controller.GpsX =
                                  controller.selectedLocation?.latitude;
                              controller.GpsY =
                                  controller.selectedLocation?.longitude;
                            }
                            print(
                              "الموقع المحدد: ${controller.selectedLocation!.latitude}, ${controller.selectedLocation!.longitude}",
                            );

                            controller.update();

                            Get.back();
                            controller.getAddress(true);
                          }
                          : null,
                  label: Text(
                    "تأكيد الموقع",
                    style: TextStyle(color: AppColors.white),
                  ),
                  icon: Icon(Icons.done, size: 25, color: AppColors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
