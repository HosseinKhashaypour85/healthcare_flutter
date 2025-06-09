import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_flutter/const/shape/border_radius.dart';
import 'package:healthcare_flutter/const/shape/media_query.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';
import 'package:healthcare_flutter/features/auth_features/logic/auth_bloc.dart';
import 'package:healthcare_flutter/features/auth_features/services/auth_api_repository.dart';
import 'package:healthcare_flutter/features/auth_features/widget/passwordField_widget.dart';
import 'package:healthcare_flutter/features/auth_features/widget/textformField_widget.dart';
import 'package:healthcare_flutter/features/public_features/functions/pre_values/pre_values.dart';
import 'package:healthcare_flutter/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:healthcare_flutter/features/public_features/styles_widget/textstyle_style_widget.dart';
import 'package:healthcare_flutter/features/public_features/widget/snack_bar_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isShow = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuad,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthApiRepository()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignInAuthErrorState) {
            getSnackBarWidget(
              context,
              state.errorMessageClass.errorMsg!,
              Colors.red,
            );
          }

          if (state is SignInAuthCompletedState) {
            SecureStorage().saveUserToken(state.token);
            context.pushReplacement('/profile');
          }
        },
        builder: (context, state) {
          final isLoading = state is SignInAuthLoadingState;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),

                    // Logo with animation
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Hero(
                          tag: 'app-logo',
                          child: Image.asset(
                            PreValues().image2Url,
                            width: getWidth(context, 0.35.sp),
                            height: getWidth(context, 0.35.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Title
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          children: [
                            Text(
                              'ورود / ثبت نام',
                              style: textStyle(
                                fontSize: 24.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'سلامت آنلاین',
                              style: textStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Phone field
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'شماره موبایل',
                              style: textStyle(
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormFieldMobileWidget(
                              controller: _phoneController,
                              labelText: '09XXXXXXXXX',
                              textInputAction: TextInputAction.next,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '+98',
                                  style: textStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Password field
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'رمز عبور',
                              style: textStyle(
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            PasswordFieldWidget(
                              controller: _passwordController,
                              labelText: 'رمز عبور خود را وارد کنید',
                              textInputAction: TextInputAction.done,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              icon: Icon(
                                Icons.lock_outline,
                                size: 20.w,
                                color: Colors.grey[600],
                              ),
                              suffixIcon: null,
                              prefixIcon: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Terms checkbox
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: GestureDetector(
                          onTap: () => setState(() => isShow = !isShow),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: getBorderRadiusFunc(12),
                              border: Border.all(
                                color: isShow ? linkColor : Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: isShow ? linkColor : Colors.transparent,
                                    borderRadius: getBorderRadiusFunc(4),
                                    border: Border.all(
                                      color: isShow ? linkColor : Colors.grey[400]!,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: isShow
                                      ? Icon(
                                    Icons.check,
                                    size: 16.w,
                                    color: Colors.white,
                                  )
                                      : null,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'با ',
                                      style: textStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black87,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'شرایط و قوانین',
                                          style: textStyle(
                                            fontSize: 12.sp,
                                            color: linkColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' سلامت آنلاین موافقم',
                                          style: textStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Login button
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: linkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: getBorderRadiusFunc(12),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                              if (!isShow) {
                                getSnackBarWidget(
                                  context,
                                  'لطفاً شرایط و قوانین را بپذیرید',
                                  Colors.orange,
                                );
                                return;
                              }

                              if (_phoneController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                getSnackBarWidget(
                                  context,
                                  'لطفاً اطلاعات را کامل وارد کنید',
                                  Colors.orange,
                                );
                                return;
                              }

                              context.read<AuthBloc>().add(CallSignInEvent(
                                _phoneController.text,
                                _passwordController.text,
                              ));
                            },
                            child: isLoading
                                ? SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                                : Text(
                              'ورود',
                              style: textStyle(
                                fontSize: 16.sp,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Register link
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'حساب کاربری ندارید؟',
                              style: textStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 4.w),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.push('/register');
                              },
                              child: Text(
                                'ثبت نام',
                                style: textStyle(
                                  fontSize: 14.sp,
                                  color: linkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Divider
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                    SizedBox(height: 16.h),

                    // Social login placeholder
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Text(
                          'ورود با شبکه‌های اجتماعی (در دست توسعه)',
                          style: textStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
