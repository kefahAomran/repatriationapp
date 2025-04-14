import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/request_provider.dart';

class EditRequestScreen extends StatelessWidget {
  const EditRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RequestProvider(),
      child: const EditRequestContent(),
    );
  }
}

class EditRequestContent extends StatefulWidget {
  const EditRequestContent({super.key});

  @override
  State<EditRequestContent> createState() => _EditRequestContentState();
}

class _EditRequestContentState extends State<EditRequestContent> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _noteController.addListener(_updateNote);
  }

  @override
  void dispose() {
    _noteController.removeListener(_updateNote);
    _noteController.dispose();
    super.dispose();
  }

  void _updateNote() {
    context.read<RequestProvider>().setNote(_noteController.text);
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
            'Edit a Request',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Consumer<RequestProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: provider.selectedNeed != null
                                  ? AppColors.primary
                                  : Colors.grey,
                              width: provider.selectedNeed != null ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ListTile(
                            title: Text(
                              provider.selectedNeed ?? 'Need',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: provider.selectedNeed != null
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primary,
                            ),
                            onTap: () => _showNeedsDialog(context),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: provider.selectedDate != null
                                  ? AppColors.primary
                                  : Colors.grey,
                              width: provider.selectedDate != null ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ListTile(
                            title: Text(
                              provider.selectedDate != null
                                  ? _formatDate(provider.selectedDate!)
                                  : '11/7/2024',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: provider.selectedDate != null
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.calendar_today,
                              color: AppColors.primary,
                              size: 24.w,
                            ),
                            onTap: () => _selectDate(context),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _noteController.text.isNotEmpty
                                  ? AppColors.primary
                                  : Colors.grey,
                              width: _noteController.text.isNotEmpty ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: TextField(
                            controller: _noteController,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText:
                                  'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy ',
                              contentPadding: EdgeInsets.all(16.w),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  onPressed: provider.isValid
                                      ? () => _saveRequest(context)
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Confirm Edite',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
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

  Future<void> _showNeedsDialog(BuildContext context) async {
    final provider = context.read<RequestProvider>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Need'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: provider.needs
              .map(
                (need) => ListTile(
                  title: Text(need),
                  onTap: () {
                    provider.setNeed(need);
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final provider = context.read<RequestProvider>();
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      provider.setDate(date);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _saveRequest(BuildContext context) async {
    setState(() => _isLoading = true);
    final provider = context.read<RequestProvider>();

    try {
      final success = await provider.saveRequest();
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Request saved successfully')),
          );
          Navigator.pop(context);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save request')),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
