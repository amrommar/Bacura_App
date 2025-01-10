import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/auth/data/DataSource/auth_remote_data_source.dart';
import 'package:bacura_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:bacura_app/feature/auth/domain/entities/user.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_phonefield.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // ✅ Added for internet check
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  final mobileNumberController = TextEditingController();
  bool isLoading = false;

  // ✅ Correct Use Case Initialization
  final LoginUseCase loginUseCase = LoginUseCase(
    AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(dio: Dio()),
    ),
  );

  // ✅ Internet Connection Check
  Future<bool> _isConnected() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  // 🔥 Enhanced Login Function with Debugging
  Future<void> _handleLogin() async {
    print("🟢 Login button clicked!"); // ✅ Check if this prints

    if (mobileNumberController.text.isEmpty || mobileNumberController.text.length < 9) {
      _showErrorMessage("⚠️ Please enter a valid phone number.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      print("📤 Sending login request...");

      await loginUseCase.call(
        User(
          phone: mobileNumberController.text,
          countryCode: '+966',
        ),
      );

      print("✅ Login successful, navigating to OTP screen...");
      Navigator.pushNamed(context, Routes.verifyOTPRoute);
    } catch (e) {
      print("❌ Login failed: $e");
      _showErrorMessage("Login failed.$e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // ⚠️ Error Message in Snackbar
  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorManager.darkRedColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BacuraLogoContainer(),
            SizedBox(height: 50.h),
            Text("Login", style: Theme.of(context).textTheme.displayLarge),
            Divider(color: ColorManager.lightBlueColor),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPhoneField(
                fieldName: "Mobile Number",
                hintText: "Enter your mobile number",
                controller: mobileNumberController,
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryBlueColor,
                      ),
                      child: Text("Login", style: TextStyle(color: Colors.white)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
