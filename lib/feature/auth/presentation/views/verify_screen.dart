import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';

class VerifyScreen extends StatefulWidget {
  final String mobileNumber;

  const VerifyScreen({super.key, required this.mobileNumber});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var formKey = GlobalKey<FormState>();
  int _counter = 60;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _counter = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AppAssets.background2Image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: AppSizes.ph30,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              toolbarHeight: AppSizes.ph100),
          backgroundColor: ColorManager.transparent,
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) => Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.pw29),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const BacuraLogoWidget(),
                    SizedBox(height: AppSizes.ph50),
                    Text(
                      tr(AppStrings.otp),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Divider(color: ColorManager.lightBlueColor),
                    SizedBox(height: AppSizes.ph10),
                    Text(
                      tr(AppStrings.OtpSentTo),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.greyColor,
                          ),
                    ),
                    ChangeNumberWidget(
                      mobileNumber: widget.mobileNumber,
                    ),
                    SizedBox(height: AppSizes.ph30),
                    SizedBox(
                      height: AppSizes.ph100,
                      child: Form(
                        key: formKey,
                        child: CustomPinCodeTextField(
                          onChanged: (value) {
                            provider.pinCode = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.ph50),
                    Center(
                        child: Column(children: [
                      VerifyButtonWidget(
                        onPressed: () {
                          provider.validatePin(context, widget.mobileNumber);
                        },
                      ),
                      SizedBox(height: AppSizes.ph20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: _canResend
                                ? () {
                                    provider.verifyOtp(
                                      countryCode: AppConstants.countryCode,
                                      mobileNumber: widget.mobileNumber,
                                    );
                                    _startTimer();
                                  }
                                : null,
                            child: Text(
                              tr(AppStrings.resend),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: _canResend ? Colors.blue : Colors.grey),
                            ),
                          ),
                          SizedBox(width: AppSizes.pw20),
                          Text(
                            "$_counter",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: ColorManager.greyColor,
                                ),
                          )
                        ],
                      )
                    ]))
                  ])),
            ),
          ))
    ]);
  }
}
