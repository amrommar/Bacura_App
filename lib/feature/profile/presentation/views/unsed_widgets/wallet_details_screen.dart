import 'package:bacura_app/core/utils/index.dart';

class WalletDetailsScreen extends StatefulWidget {
  const WalletDetailsScreen({super.key});

  @override
  State<WalletDetailsScreen> createState() => _WalletDetailsScreenState();
}

class _WalletDetailsScreenState extends State<WalletDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(elevation: 0),
        body: SingleChildScrollView(
            child: Column(children: [
          /// Avatar Section (profile image/ icons) ___________________________________________________________________
          Stack(
              clipBehavior: Clip.none,
              // This allows the profile image to overflow out of the container
              children: [
                Container(height: 80.h, color: ColorManager.primaryBlueColor),
                // Profile image ____________________________________________________
                Positioned(
                    top: 20.h,
                    // Adjust this to make the profile picture half outside the blue container
                    left: 0.w,
                    right: 0.w,
                    child: Column(children: [
                      CircleAvatar(
                        radius: AppSizes.br50,
                        backgroundImage: AssetImage('assets/images/Ellipse 1.png'),
                      ),
                      SizedBox(height: AppSizes.ph8),

                      //// User name ///////////////////////////////////

                      Text('محمد صلاح',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold))
                    ]))
              ]),
          SizedBox(height: AppSizes.ph100),

          /// Container of Wallet Balance_______________________________

          Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.pw16, vertical: AppSizes.ph16),
              child: Stack(alignment: Alignment.topRight, children: [
                ////  if the background image will or not //////////////////////////
                SvgPicture.asset('assets/images/walletCard_background.svg'),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.pw20, vertical: AppSizes.ph20),
                    child: Column(children: [
                      Text(
                        AppLocalizations.of(context)!.walletBalance,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorManager.lightGreyColor,
                            ),
                      ),
                      SizedBox(height: AppSizes.ph10),
                      Text(
                        '1000 ريال',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorManager.whiteColor,
                            ),
                      ),
                    ]))
              ])),

          ////Row of three buttons ( add money / deposit / pay) _____________________________________

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //// add money click //////////////////////////////
            Column(children: [
              InkWell(
                onTap: () {
                  /// function to go to add money to the Wallet ///////////////////////
                },
                child: CustomShadowWidget(
                    childWidget: Icon(
                  Icons.add_circle_outline_outlined,
                  size: AppSizes.ph35,
                  color: ColorManager.primaryBlueColor,
                )),
              ),
              Text(
                AppLocalizations.of(context)!.addMoney,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ]),
            ////  Deposit click to go to deposit last operations //////////////////////////////
            Column(children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.lastOperationsRoute);
                  },
                  child: CustomShadowWidget(
                    childWidget: Icon(Icons.arrow_circle_down_outlined,
                        size: AppSizes.ph35, color: ColorManager.primaryBlueColor),
                  )),
              Text(
                AppLocalizations.of(context)!.deposits,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ]),
            ////  Payments click to go to Payments last operations //////////////////////////////
            Column(children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.lastOperationsRoute);
                  },
                  child: CustomShadowWidget(
                      childWidget: Icon(
                    Icons.monetization_on_outlined,
                    size: AppSizes.ph35,
                    color: ColorManager.primaryBlueColor,
                  ))),
              Text(
                AppLocalizations.of(context)!.payment,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ])
          ]),
          SizedBox(height: AppSizes.ph50),
          //// last operations Section //////////////////////////////
          Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.ph16, horizontal: AppSizes.pw16),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    AppLocalizations.of(context)!.lastOperations,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.lastOperationsRoute);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.all,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ]),
                Container(
                  margin: EdgeInsets.symmetric(vertical: AppSizes.ph8),
                  height: AppSizes.ph50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Ellipse 1.png'),
                      SizedBox(width: AppSizes.pw16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.wallet,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              AppLocalizations.of(context)!.deposit,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.greyColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const Text('1200 ريال'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: AppSizes.ph8),
                    height: AppSizes.ph50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Image.asset('assets/images/Ellipse 1.png'),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text(
                              'شركة باكورة التقنيات',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(AppLocalizations.of(context)!.payment,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: ColorManager.greyColor,
                                    ))
                          ])),
                      const Text('250 ريال'),
                    ]))
              ]))
        ])));
  }
}
