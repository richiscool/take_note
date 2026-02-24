import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello Note Taker!',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              height: 200.h,
              child: Image.asset('assets/images/onboarding.png'),
            ),
            
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/auth');
              },
              child:Text('Let\'s Go!', style: GoogleFonts.geologica(fontWeight: FontWeight.w300, fontSize: 18.sp),)
            ),
          ],
        ),
      ),
    );
  }
}