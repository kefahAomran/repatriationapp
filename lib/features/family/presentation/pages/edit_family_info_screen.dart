import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/family_info_provider.dart';

class EditFamilyInfoScreen extends StatefulWidget {
  const EditFamilyInfoScreen({super.key});

  @override
  State<EditFamilyInfoScreen> createState() => _EditFamilyInfoScreenState();
}

class _EditFamilyInfoScreenState extends State<EditFamilyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentCountryController = TextEditingController();
  final _currentRegionController = TextEditingController();
  final _currentZoneController = TextEditingController();
  final _currentResidenceController = TextEditingController();
  final _currentZipController = TextEditingController();
  final _currentMobileNumber = TextEditingController();
  final _currentAddress = TextEditingController();
  final _currentZone = TextEditingController();

  final _destinationCountryController = TextEditingController();
  final _destinationRegionController = TextEditingController();
  final _destinationZoneController = TextEditingController();
  final _destinationResidenceController = TextEditingController();
  final _destinationZipController = TextEditingController();
  final _destinationMobileNumberController = TextEditingController();
  final _destinationAddressController = TextEditingController();
  final List<String> countries = [
    "Saudi Arabia",
    "Syrian ",
    "United States",
    "India",
    "United Kingdom"
  ];

  final List<String> residences = [
    "Urban",
    "Rural",
    "Suburban",
    "Coastal",
    "Mountainous"
  ];
  final List<String> zones = [
    "Riyadh Province",
    "Makkah Region",
    "Eastern Province",
    "Asir Region",
    "Al-Qassim Zone"
  ];
  final List<String> regions = ["North", "South", "East", "West", "Central"];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    final familyInfo = Provider.of<FamilyInfoProvider>(context, listen: false);
    final currentLocation = familyInfo.currentLocation;
    final destinationLocation = familyInfo.destinationLocation;

    _currentCountryController.text = currentLocation.country;
    _currentRegionController.text = currentLocation.region;
    _currentZoneController.text = currentLocation.zone;
    _currentResidenceController.text = currentLocation.residence;
    _currentZipController.text = currentLocation.zip;
    _currentMobileNumber.text = currentLocation.mobilenumber;

    _destinationCountryController.text = destinationLocation.country;
    _destinationRegionController.text = destinationLocation.region;
    _destinationZoneController.text = destinationLocation.zone;
    _destinationResidenceController.text = destinationLocation.residence;
    _destinationZipController.text = destinationLocation.zip;
    _destinationMobileNumberController.text = destinationLocation.mobilenumber;
    _destinationAddressController.text = destinationLocation.address;
  }

  Future<void> _saveFamilyInfo() async {
    if (_formKey.currentState!.validate()) {
      final familyInfo =
          Provider.of<FamilyInfoProvider>(context, listen: false);

      final currentLocation = FamilyLocation(
        country: _currentCountryController.text,
        region: _currentRegionController.text,
        zone: _currentZoneController.text,
        residence: _currentResidenceController.text,
        zip: _currentZipController.text,
        mobilenumber: _currentMobileNumber.text,
        address: _currentAddress.text,
      );

      final destinationLocation = FamilyLocation(
          country: _destinationCountryController.text,
          region: _destinationRegionController.text,
          zone: _destinationZoneController.text,
          residence: _destinationResidenceController.text,
          zip: _destinationZipController.text,
          address: _destinationAddressController.text,
          mobilenumber: _destinationMobileNumberController.text);

      familyInfo.updateCurrentLocation(currentLocation);
      familyInfo.updateDestinationLocation(destinationLocation);

      await familyInfo.saveFamilyInfo();

      if (familyInfo.error != null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(familyInfo.error!)),
        );
      } else {
        if (!mounted) return;
        Navigator.pop(context);
      }
    }
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: DropdownButtonFormField<String>(
        isDense: true,
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14.sp,
            fontFamily: 'Manrope',
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(fontSize: 16.sp, fontFamily: 'Manrope'),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isFullWidth = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      margin: EdgeInsets.only(bottom: 16.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
            fontFamily: 'Manrope',
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Family Info',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black, size: 24.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCurrentLocationSection(),
                    SizedBox(height: 24.h),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
          Consumer<FamilyInfoProvider>(
            builder: (context, familyInfo, child) {
              return familyInfo.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                label: 'Country',
                items: countries,
                selectedValue: _currentCountryController.text.isEmpty
                    ? null
                    : _currentCountryController.text,
                onChanged: (value) =>
                    _currentCountryController.text = value ?? '',
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: _buildDropdownField(
                label: 'Region',
                items: regions,
                selectedValue: _currentRegionController.text.isEmpty
                    ? null
                    : _currentRegionController.text,
                onChanged: (value) =>
                    _currentRegionController.text = value ?? '',
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        _buildDropdownField(
          label: 'Zone',
          items: zones,
          selectedValue: _currentZoneController.text.isEmpty
              ? null
              : _currentZoneController.text,
          onChanged: (value) => _currentZoneController.text = value ?? '',
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildDropdownField(
                label: 'Residence',
                items: residences,
                selectedValue: _currentResidenceController.text.isEmpty
                    ? null
                    : _currentResidenceController.text,
                onChanged: (value) =>
                    _currentResidenceController.text = value ?? '',
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildInputField(
                label: 'GPS',
                controller: _currentZipController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        _buildInputField(
          label: 'Address',
          controller: _currentAddress,
          isFullWidth: true,
        ),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                label: 'Mobile Number',
                controller: _currentMobileNumber,
                keyboardType: TextInputType.phone,
                isFullWidth: true,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildDropdownField(
                label: 'Region',
                items: regions,
                selectedValue: _destinationRegionController.text.isEmpty
                    ? null
                    : _destinationRegionController.text,
                onChanged: (value) =>
                    _destinationRegionController.text = value ?? '',
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        _buildInputField(
          label: 'OZoneId',
          controller: _destinationZoneController,
          isFullWidth: true,
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildInputField(
                label: 'Origin GPS ',
                controller: _destinationResidenceController,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildInputField(
                label: 'Exit Date',
                controller: _destinationZipController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: _saveFamilyInfo,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentCountryController.dispose();
    _currentRegionController.dispose();
    _currentZoneController.dispose();
    _currentResidenceController.dispose();
    _currentZipController.dispose();
    _currentMobileNumber.dispose();

    _destinationCountryController.dispose();
    _destinationRegionController.dispose();
    _destinationZoneController.dispose();
    _destinationResidenceController.dispose();
    _destinationZipController.dispose();
    _destinationMobileNumberController.dispose();
    super.dispose();
  }
}
