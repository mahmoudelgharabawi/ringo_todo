import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/module/auth/widgets/social_button.widget.dart';
import 'package:ringo_todo/module/project_summary/project_summary.page.dart';
import 'package:ringo_todo/utils/app.assets.dart';
import 'package:ringo_todo/widgets/app_elevated_button.dart';
import 'package:ringo_todo/widgets/app_safe_area.widget.dart';
import 'package:ringo_todo/widgets/app_text_field.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _userTextEditingController;
  late TextEditingController _passwordTextEditingController;
  bool obscurePassword = true;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _userTextEditingController = TextEditingController();
    _userTextEditingController.addListener(() {
      setState(() {});
    });
    _passwordTextEditingController = TextEditingController();
    _passwordTextEditingController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _userTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  String? _validateEmailOrUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email or username';
    }
    // Basic email validation
    RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (emailRegex.hasMatch(value) || value.length >= 3) {
      return null;
    }
    return 'Please enter a valid email or username';
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  bool get canLogin =>
      _userTextEditingController.text != '' &&
      _passwordTextEditingController.text != '';

  Widget get passwordSuffixIcon =>
      SvgPicture.asset(obscurePassword ? AppAssets.eyeSlash : AppAssets.eye);

  void _onLogin() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const ProjectSummaryPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 4.5, 0),
              child: Text(
                'Dont’t have an account?',
                style: GoogleFonts.getFont(
                  'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: -0.1,
                  color: Color(0xFF96A0B5),
                ),
              ),
            ),
            Text(
              'Register Here',
              style: GoogleFonts.getFont(
                'Urbanist',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 1.4,
                letterSpacing: -0.1,
                color: Color(0xFF191D2B),
              ),
            ),
          ],
        ),
      ),
      body: AppSafeArea(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Login',
                              style: GoogleFonts.getFont(
                                'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                height: 1.3,
                                letterSpacing: -0.5,
                                color: Color(0xFF191D2B),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Sign in to your account',
                          style: GoogleFonts.getFont(
                            'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            letterSpacing: -0.1,
                            color: Color(0xFF96A0B5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 9.3, 22.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFieldWidget(
                        hint: 'Enter Username / Email Here',
                        label: 'Username / Email',
                        controller: _userTextEditingController,
                        validator: _validateEmailOrUsername,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      AppTextFieldWidget(
                        obscureText: obscurePassword,
                        hint: 'Enter Password Here',
                        label: 'Password',
                        controller: _passwordTextEditingController,
                        validator: _validatePassword,
                        suffixIcon: InkWell(
                            onTap: () => setState(() {
                                  obscurePassword = !obscurePassword;
                                }),
                            child: passwordSuffixIcon),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password ?',
                        style: GoogleFonts.getFont(
                          'Urbanist',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.4,
                          letterSpacing: -0.1,
                          color: Color(0xFF191D2B),
                        ),
                      ),
                    ],
                  ),
                ),
                AppElevatedButton(
                    onPressed: canLogin ? _onLogin : null, label: 'Login'),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 8.7, 24),
                  child: Text(
                    'Or login with account',
                    style: GoogleFonts.getFont(
                      'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 1.3,
                      letterSpacing: -0.1,
                      color: Color(0xFF96A0B5),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 9.3, 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SocialButtonWidget(
                          title: 'Continue with Google',
                          svgPath: 'google_x2.svg'),
                      SocialButtonWidget(
                          title: 'Continue with Facebook',
                          svgPath: 'vector_x2.svg'),
                      SocialButtonWidget(
                          title: 'Continue with Apple',
                          svgPath: 'vector_5_x2.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
