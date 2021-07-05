import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanBottomSheet extends StatefulWidget {
  const PlanBottomSheet({Key? key}) : super(key: key);

  @override
  _PlanBottomSheetState createState() => _PlanBottomSheetState();
}

class _PlanBottomSheetState extends State<PlanBottomSheet> {
  final double width = Get.width;
  final double height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: height * 0.96,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
              child: Icon(
                Icons.cancel,
                size: 38,
              ),
            ),
          ),
          Container(
            height: height * 0.8,
            decoration: BoxDecoration(color: Colors.white),
          )
        ],
      ),
    );
  }
}
