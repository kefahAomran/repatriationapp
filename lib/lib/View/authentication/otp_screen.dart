import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../Controller/VerificationController.dart';
// import 'package:repatriationapp/Controller/VerificationController.dart';

import '../../Component/app_colors.dart';
import 'package:get/get.dart';

import '../../Controller/SignupController.dart';
import 'login_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final VerificationController controller = Get.put(VerificationController());
  bool _isTimerActive = true;
  int _timerSeconds = 60;
  bool _isVerified = false;
  bool _showCheckmark = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
          _startTimer();
        } else {
          _isTimerActive = false;
        }
      });
    });
  }

  void _showInvalidOTPDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Invalid OTP'.tr),
            content: Text(
              'The OTP you entered is incorrect. Please try again.'.tr,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Try Again'.tr),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final SignupController controllerSign = Get.put(SignupController());
    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.15,
      height: screenHeight * 0.07,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.05,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textSecondary.withOpacity(0.3)),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الجزء العلوي
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter OTP'.tr,
                            style: TextStyle(
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Please enter the verification code sent to your phone number'
                                .tr,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: AppColors.textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Pinput(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              } else {
                                return null;
                              }
                            },

                            length: 6,
                            controller: controller.pinController.value,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border: Border.all(color: AppColors.primary),
                              ),
                            ),
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Center(
                        child:
                            _isTimerActive
                                ? Text(
                                  'Resend code in ${_timerSeconds}s'.tr,
                                  style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    color: AppColors.textSecondary,
                                  ),
                                )
                                : TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isTimerActive = true;
                                      _timerSeconds = 60;
                                    });
                                    _startTimer();
                                  },
                                  child: Text(
                                    'Resend Code'.tr,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                      ),
                      if (_showCheckmark)
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.03,
                          ),
                          child: Align(
                            alignment:
                                Alignment.center, // وضع الشعار في منتصف العرض
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: constraints.maxWidth * 0.25,
                              height: constraints.maxWidth * 0.25,
                              decoration: BoxDecoration(
                                color: _isVerified ? Colors.green : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: constraints.maxWidth * 0.1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // زر التحقق في الأسفل
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.1,
                    vertical: constraints.maxHeight * 0.02,
                  ),
                  child: Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.07,
                      child: ElevatedButton(
                        onPressed:
                            controller.verify.value
                                ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    String error =
                                        await controller.verificationCode();
                                    if (error != "") {
                                      Get.snackbar("خطأ", error);
                                    } else {
                                      Get.to(LoginScreen());
                                    }

                                    // Handle registration
                                  }
                                }
                                : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:
                            controller.verify.value
                                ? Text(
                                  'Verify'.tr,
                                  style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.045,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                )
                                : Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
