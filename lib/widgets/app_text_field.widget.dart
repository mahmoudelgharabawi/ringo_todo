import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.colors.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? enabled;

  const AppTextFieldWidget(
      {required this.label,
      required this.hint,
      this.controller,
      this.suffixIcon,
      this.enabled = true,
      this.obscureText = false,
      this.validator,
      super.key});

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.getFont(
            'Urbanist',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: -0.1,
            color: AppColors.mainColor,
          ),
        ),
        TextFormField(
          enabled: widget.enabled,
          obscureText: widget.obscureText,
          obscuringCharacter: '*',
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 25, maxWidth: 25),
            suffixIcon: widget.suffixIcon,
            alignLabelWithHint: true,
            hintStyle: GoogleFonts.getFont(
              'Urbanist',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.2,
              color: AppColors.greyColor,
            ),
            hintText: widget.hint,
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.greyColor.withOpacity(.3)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
          ),
          style: GoogleFonts.getFont(
            'Urbanist',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            letterSpacing: -0.3,
            color: AppColors.mainColor,
          ),
        ),
      ],
    );
  }
}
