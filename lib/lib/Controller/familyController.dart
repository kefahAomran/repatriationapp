import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Model/FamilyModel.dart';
import '../Model/configrationModel.dart' show Region, Zone;
import '../Services/API.dart';
import 'authentication_manager.dart';
import 'cache_manager.dart';
// import 'package:geocoding/geocoding.dart';

class Familycontroller extends GetxController with CacheManager {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    await getRequest();
  }

  List<Zone> zonelocal = [];
  List<Zone> zoneOriginalLocal = [];
  List<Region> regionlocal = [];
  List<Region> regionOriginallocal = [];
  final Rx<TextEditingController> currentMobileNumber =
      TextEditingController().obs;
  final Rx<TextEditingController> currentAddress = TextEditingController().obs;
  final Rx<TextEditingController> originalAddress = TextEditingController().obs;
  final Rx<TextEditingController> destinationZoneController =
      TextEditingController().obs;
  final Rx<TextEditingController> destinationResidenceController =
      TextEditingController().obs;
  final Rx<TextEditingController> destinationZipController =
      TextEditingController().obs;
  var chooseCountry,
      chooseCountryOriginal,
      chooseRegion,
      chooseZone,
      chooseResidencetype,
      chooseOriRegion,
      chooseOriZone,
      originalGpsX,
      originalGpsY,
      GpsX,
      GpsY,
      chooseExittype;
  var getrequests = true.obs;
  var getAddress = true.obs;

  var marker;

  LatLng? selectedLocation;
  var checkBoxVal = false.obs;
  Data data = Data();

  // Future<String> getAddressFromLatLng(double lat, double lng) async {
  //   String address = "";
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
  //     Placemark place = placemarks[0];

  //     address = "${place.street}, ${place.locality}, ${place.country}";
  //     print("العنوان: $address");
  //   } catch (e) {
  //     print("فشل في جلب العنوان: $e");
  //   }
  //   return address;
  // }

  getRequest() async {
    getrequests(false);

    try {
      List signupResp = await API.getFamily();

      data = signupResp[0];
      print(data);
      print("data.isChecked ${data.isChecked}");
      checkBoxVal.value = data.isChecked ?? false;
      currentMobileNumber.value.text = data.mobileNo ?? "";
      currentAddress.value.text = data.address ?? "";
      originalAddress.value.text = data.originalAddress ?? "";
      destinationZipController.value.text = data.exitDate ?? "";
      chooseCountry = data.country!;
      chooseRegion = data.region!;
      chooseZone = data.zone!;
      chooseExittype = data.exitType!;
      chooseResidencetype = data.residenceType!;
      chooseCountryOriginal = data.originalCountry!;
      chooseOriRegion = data.originalRegion!;
      chooseOriZone = data.originalZone!;
      originalGpsX = data.originalGpsX;
      originalGpsY = data.originalGpsY;
      GpsX = data.gpsX;
      GpsY = data.gpsY;
    } catch (e) {
      error = "Connection Error";
      print(e);
    } finally {
      getrequests(true);
    }
  }

  String error = "";
  var finishAdd = true.obs;
  Future<String> editfamily() async {
    error = "";
    finishAdd(false);
    try {
      List jscg_addprocess = await API.editFamily(
        gpsX: GpsX,
        gpsY: GpsY,
        originalGpsX: originalGpsX,
        originalGpsY: originalGpsY,
        originalRegion: chooseOriRegion?.code,
        originalZone: chooseOriZone?.code,
        address: currentAddress.value.text,
        uid: data.uid!,
        exitDate: destinationZipController.value.text,
        mobileNo: currentMobileNumber.value.text,
        exitType: chooseExittype.code,
        country: chooseCountry.code,
        region: chooseRegion.code,
        zone: chooseZone.code,
        residenceType: chooseResidencetype.code,
        id: data.id!,
        originalCountry: chooseCountryOriginal?.code,
        originalAddress: originalAddress.value.text,
        isChecked: checkBoxVal.value,
      );

      if (jscg_addprocess[0] != "") {
        //success
      } else {
        error = jscg_addprocess[1];
      }
    } finally {
      finishAdd(true);
    }

    return error;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // تحقق من صلاحية الوصول للموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // الحصول على الإحداثيات

    return await Geolocator.getCurrentPosition();
  }
}
