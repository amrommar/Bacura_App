import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpHomeScreen extends StatefulWidget {
  @override
  State<SpHomeScreen> createState() => _SpHomeScreenState();
}

class _SpHomeScreenState extends State<SpHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Text('هلا، محمد',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                  )),
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.spProfileDetailsRoute);
              },
              child: Row(children: [
                SizedBox(width: AppSizes.pw8),
                Flexible(
                    child: CircleAvatar(
                        radius: AppSizes.br24,
                        backgroundColor: ColorManager.whiteColor,
                        child: Image.asset('assets/images/Ellipse 1.png')))
              ])),
          actions: [
            IconButton(
                icon: Icon(Icons.email_outlined, size: AppSizes.ph30),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.messagesRoute);
                }),
            IconButton(
                icon: Icon(Icons.notifications, size: AppSizes.ph30),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsRoute);
                }),
          ]),
      body: Column(children: [
        /// Requests section ///////////////////////////////////////////////////////
        Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {}, child: SPRequestItemWidget());
                }))
      ]),
    );
  }
}
