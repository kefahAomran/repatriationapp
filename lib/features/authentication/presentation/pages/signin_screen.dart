import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/signin_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_textfield.dart'; // Assuming you have a custom textfield
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/routes/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: AppColors.textPrimary, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  // Logo
                  Image.asset(
                    'assets/icpc_logo.png', // Make sure this asset exists
                    height: 120.w,
                    width: 120.w,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Welcome Back', // Corrected text
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontFamily: 'Manrope', // Ensure this font is configured
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Please enter a form to login this app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textSecondary,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Phone Number Input
                  _buildPhoneNumberInput(context),
                  SizedBox(height: 20.h),

                  // Password Input
                  _buildPasswordInput(context),
                  SizedBox(height: 12.h),

                  // Forgot Password (Optional, add if needed)
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () { /* TODO: Implement Forgot Password */ },
                  //     child: Text('Forgot Password?'),
                  //   ),
                  // ),

                  SizedBox(height: 30.h),

                  // Error Message Display
                  Consumer<SignInProvider>(
                    builder: (context, provider, child) {
                      if (provider.error != null) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Text(
                            provider.error!,
                            style: TextStyle(
                                color: AppColors.actionRed, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  // Sign In Button
                  Consumer<SignInProvider>(
                    builder: (context, provider, child) {
                      return PrimaryButton(
                        text: 'Sign In',
                        isLoading: provider.isLoading,
                        onPressed: () async {
                          // Reset error before attempting sign in
                          provider.resetError();
                          if (_formKey.currentState?.validate() ?? false) {
                            bool success = await provider.signIn(
                              phoneNumber: _phoneNumberController.text,
                              password: _passwordController.text,
                            );
                            if (success && mounted) {
                              AppRoutes.navigateToHome(context);
                              // TODO: Navigate to HomeScreen or OTP screen based on logic
                              // Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              AppRoutes.navigateToHome(context);
                            }
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(height: 30.h),

                  // Register Link
                  _buildRegisterLink(context),
                  SizedBox(height: 40.h), // Bottom padding
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Consumer<SignInProvider>(
          builder: (context, provider, child) {
            return CustomTextField(
              controller: _phoneNumberController,
              hintText: 'e.g 812-3123-3123',
              keyboardType: TextInputType.phone,
              prefixIcon: _buildCountryCodePicker(provider),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                // Add more specific phone validation if needed
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildCountryCodePicker(SignInProvider provider) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 8.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Placeholder for flag - replace with actual flag image based on code
          Container(
              width: 20.w,
              height: 15.h,
              color: Colors.grey[300],
              margin: EdgeInsets.only(right: 8.w)),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: provider.selectedCountryCode,
              items: provider.countryCodes.map((String code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code,
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.textPrimary)),
                );
              }).toList(),
              onChanged: (value) {
                provider.selectCountryCode(value);
              },
              icon: Icon(Icons.keyboard_arrow_down,
                  size: 20.sp, color: AppColors.textSecondary),
            ),
          ),
          SizedBox(width: 8.w),
          Container(height: 24.h, width: 1.w, color: AppColors.borderColor),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Consumer<SignInProvider>(
          builder: (context, provider, child) {
            return CustomTextField(
              controller: _passwordController,
              hintText: '**********',
              obscureText: !provider.isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  provider.isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.textSecondary,
                  size: 20.sp,
                ),
                onPressed: provider.togglePasswordVisibility,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to Register Screen
            AppRoutes.navigateToRegister(context);
            // Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.actionBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
