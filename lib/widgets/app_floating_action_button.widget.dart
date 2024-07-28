import 'package:flutter/material.dart';
import 'package:ringo_todo/utils/app.colors.dart';

class AppFloatingActionButtonWidget extends StatelessWidget {
  const AppFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
