import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/utils/app_colors.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  final String userName;
  final String userPhoto;
  final ViewController viewController;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.userPhoto,
    required this.viewController,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLightTheme =
          widget.viewController.state.value == Brightness.light;
      return Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardDarkBackground,
                    border: Border.all(color: AppColors.borderLight, width: 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(widget.userPhoto, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: TextStyle(
                        color: (isLightTheme)
                            ? AppColors.tertiaryText
                            : AppColors.primaryText,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      widget.userName,
                      style: TextStyle(
                        color: (isLightTheme)
                            ? AppColors.tertiaryText
                            : AppColors.primaryText,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.cardDarkBackground.withAlpha(100),
                borderRadius: BorderRadius.circular(25.r),
                border: BoxBorder.all(color: AppColors.primaryText, width: 1.w),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                borderRadius: BorderRadius.circular(22.r),
                onTap: () {
                  widget.viewController.updateTheme(
                    (isLightTheme) ? Brightness.dark : Brightness.light,
                  );
                },
                child: Icon(
                  (isLightTheme) ? Icons.dark_mode : Icons.light_mode,
                  color: AppColors.primaryText,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
