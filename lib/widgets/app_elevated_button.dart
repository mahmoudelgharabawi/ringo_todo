import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.colors.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AppElevatedButton(
      {required this.onPressed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize:
                const MaterialStatePropertyAll(Size(double.maxFinite, 60)),
            backgroundColor: MaterialStatePropertyAll(
                onPressed == null ? AppColors.greyColor : AppColors.mainColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        onPressed: onPressed,
        child: Text(
          label,
          style: GoogleFonts.getFont(
            'Urbanist',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 1.5,
            letterSpacing: -0.3,
            color: const Color(0xFFFFFFFF),
          ),
        ));
  }
}
