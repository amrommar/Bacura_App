import 'package:bacura_app/core/utils/index.dart';

class FQAContainer extends StatelessWidget {
  String question;
  String answer;

  FQAContainer({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 12, left: 12),
      decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.primaryBlueColor),
          boxShadow: [
            BoxShadow(
              color: ColorManager.soLightGreyColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.question_mark_outlined,
                color: ColorManager.primaryBlueColor,
              ),
              Expanded(
                child: Text(
                  question,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                ),
              ),
            ],
          ),
          Divider(
            color: ColorManager.whiteColor,
            height: 5,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.question_answer_outlined,
                color: ColorManager.midBlueColor,
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(answer,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.greyColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
