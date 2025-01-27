import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/Screens/reset_password_screen.dart';
import 'package:task_manager/ui/Screens/sign_in_screen.dart';
import 'package:task_manager/ui/Screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgotPasswordVerifyOtpScreen extends StatefulWidget {
  const ForgotPasswordVerifyOtpScreen({super.key});
  static const String name = '/forgot-password/verify-otp/screen';

  @override
  State<ForgotPasswordVerifyOtpScreen> createState() =>
      _ForgotPasswordVerifyOtpScreenState();
}

class _ForgotPasswordVerifyOtpScreenState
    extends State<ForgotPasswordVerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text("Pin Verification", style: textTheme.titleLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'A 6 digits of OTP has been sent to your email address',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildPinCodeTextField(),

                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ResetPasswordScreen.name);
                    },
                    child:const Text('Verify'),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: _buildSignInSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller:_otpTEController,
                  appContext:context,
                );
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
          text: " Have an account? ",
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: 'Sign In',
              style: const TextStyle(
                color: AppColors.themeColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamedAndRemoveUntil(context,  SignInScreen.name, (value) => false);
                },
            ),
          ]),
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
