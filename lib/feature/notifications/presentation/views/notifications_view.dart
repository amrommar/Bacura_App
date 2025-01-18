import 'package:bacura_app/core/utils/index.dart';

class NotificationsView extends StatefulWidget {
  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notifications)),
      body: const NotificationsViewBody(),
    );
  }
}
