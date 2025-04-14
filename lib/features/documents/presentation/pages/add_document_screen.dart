import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/document_provider.dart';

class AddDocumentScreen extends StatelessWidget {
  const AddDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentProvider(),
      child: const AddDocumentContent(),
    );
  }
}

class AddDocumentContent extends StatefulWidget {
  const AddDocumentContent({super.key});

  @override
  State<AddDocumentContent> createState() => _AddDocumentContentState();
}

class _AddDocumentContentState extends State<AddDocumentContent> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();
  final _currentTitelController = TextEditingController();

  List<String> documentTypes = [
    "Passport",
    "ID Card",
    "Driver's License",
    "Birth Certificate",
    "Marriage Certificate",
    "Bank Statement",
    "Utility Bill",
    "Rental Agreement",
    "Insurance Policy",
    "Medical Record",
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // يمكن تغييرها حسب اللغة
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Add Doc',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          centerTitle: true,
        ),
        body: SafeArea(
          child: Consumer<DocumentProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Upload Image',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        _buildImageUploadSection(provider),
                        if (provider.error != null)
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              provider.error!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(height: 24.h),
                        _buildDropdownField(
                          label: 'Title',
                          items: documentTypes,
                          selectedValue: _currentTitelController.text.isEmpty
                              ? null
                              : _currentTitelController.text,
                          onChanged: (value) =>
                              _currentTitelController.text = value ?? '',
                        ),
                        SizedBox(height: 16.h),
                        _buildTextField(
                          controller: _descriptionController,
                          hint: 'Description',
                        ),
                        SizedBox(height: 16.h),
                        _buildTextField(
                          controller: _notesController,
                          hint: 'Notes',
                        ),
                        SizedBox(height: 24.h),
                        _buildSaveButton(provider),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
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
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
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

  Widget _buildImageUploadSection(DocumentProvider provider) {
    return GestureDetector(
      onTap: provider.isLoading ? null : provider.pickImage,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: provider.hasValidImage ? AppColors.primary : Colors.grey,
            width: provider.hasValidImage ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: provider.selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    Image.file(
                      provider.selectedImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: provider.reset,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 48.w,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'JPG,JPEG less than',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '500 Kb',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
          color: controller.text.isNotEmpty ? AppColors.primary : Colors.grey,
          width: controller.text.isNotEmpty ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(16.w),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSaveButton(DocumentProvider provider) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed:
                  provider.hasValidImage ? () => _saveDocument(provider) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Save and close',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  Future<void> _saveDocument(DocumentProvider provider) async {
    if (_formKey.currentState?.validate() ?? false) {
      final success = await provider.uploadDocument();
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document uploaded successfully')),
        );
        Navigator.pop(context);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload document')),
        );
      }
    }
  }
}
