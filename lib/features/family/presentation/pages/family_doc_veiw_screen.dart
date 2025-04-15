import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '/features/family/presentation/pages/family_doc_veiw_screen.dart';

class FamilyDocVeiwScreen extends StatefulWidget {
  const FamilyDocVeiwScreen({Key? key}) : super(key: key);

  @override
  _FamilyDocVeiwScreenState createState() => _FamilyDocVeiwScreenState();
}

class _FamilyDocVeiwScreenState extends State<FamilyDocVeiwScreen> {
  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8.w),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Documnets ',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Type:',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                            ),
                            Row(
                              children: [
                                TextFormField(
                                  initialValue: 'ID_Card',
                                  decoration: InputDecoration(
                                    hintText: 'Enter Type',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Member label and text field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Member:',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                            ),
                            Row(
                              children: [
                                TextFormField(
                                  initialValue: 'Member_Name',
                                  decoration: InputDecoration(
                                    hintText: 'Enter Member Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Popup menu button
                        PopupMenuButton<String>(
                          icon: Icon(Icons.more_vert, size: 24.w),
                          onSelected: (value) =>
                              _handleMenuSelection(value, context),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            _buildPopupMenuItem(
                              value: 'edit',
                              icon: Icons.edit,
                              label: 'Edit',
                              color: AppColors.primary,
                            ),
                            _buildPopupMenuItem(
                              value: 'delete',
                              icon: Icons.delete_outline,
                              label: 'Delete',
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text('Member:',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                    SizedBox(height: 8.h),
                    Text('Desc:',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  AppRoutes.navigateToAddDoc(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Add Request',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

void _showDeleteConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Confirmation'),
        content: Text('Are you sure you want to delete this Document?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add your delete logic here
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}

void _handleMenuSelection(String value, BuildContext context) {
  switch (value) {
    case 'edit':
      // AppRoutes.navigateToEditRequest(context);
      break;
    case 'delete':
      _showDeleteConfirmation(context);
      break;
  }
}
