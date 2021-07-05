import 'package:do_it_app/ui/widget/plan/plan_bottom_sheet.dart';
import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavPlanButton extends StatefulWidget {
  const NavPlanButton({Key? key}) : super(key: key);

  @override
  _NavPlanButtonState createState() => _NavPlanButtonState();
}

class _NavPlanButtonState extends State<NavPlanButton> {
  final double width = Get.width;
  final double height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.03),
      width: width * 0.85,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: ColorDI.bruschettaTomato,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) => PlanBottomSheet(),
          // );
          Get.toNamed('/plan');
        },
        child: Center(
          child: Text(
            '운동 계획하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
