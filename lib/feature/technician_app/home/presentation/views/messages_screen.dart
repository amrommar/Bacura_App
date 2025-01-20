import 'package:bacura_app/core/utils/index.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرسائل')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                height: 75.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorManager.whiteColor,
                      ///////////////    from Back-End     /////////////////////
                      child: Image.asset('assets/images/Ellipse 1.png')),
                  const NotificationContentWidget(),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: ColorManager.midBlueColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text('3',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: ColorManager.whiteColor,
                              )),
                    ),
                  )
                ]));
          },
          separatorBuilder: (context, index) => Container(
                width: 430.w,
                color: ColorManager.lightBlueColor,
                height: 1.h,
              ),
          itemCount: 15),
    );
  }
}
