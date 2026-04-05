import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/utils/app_colors.dart';

class HomeWidget extends StatefulWidget {
  final DataController dataController;
  final ViewController viewController;

  const HomeWidget({
    super.key,
    required this.dataController,
    required this.viewController,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(22.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 228, 187, 255),
                            borderRadius: BorderRadius.circular(25.r),
                            border: BoxBorder.all(
                              color: Color.fromARGB(255, 210, 143, 255),
                              width: 1.w,
                            ),
                          ),
                          child: Icon(
                            Iconsax.note,
                            color: AppColors.tertiaryText,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          "Start Creating Your Notes Here",
                          style: TextStyle(color: AppColors.tertiaryText),
                        ),
                        Text(
                          "Begin Note",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed("/notes");
                            },
                            child: Text("   Take Note   "),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 170.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 187, 182, 255),
                        borderRadius: BorderRadius.circular(22.sp),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22.sp),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    203,
                                    199,
                                    255,
                                  ),
                                  borderRadius: BorderRadius.circular(25.r),
                                  border: BoxBorder.all(
                                    color: const Color.fromARGB(
                                      255,
                                      187,
                                      182,
                                      255,
                                    ),
                                    width: 1.w,
                                  ),
                                ),
                                child: Icon(
                                  Iconsax.activity,
                                  color: AppColors.tertiaryText,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "View note",
                                    style: TextStyle(
                                      color: AppColors.tertiaryText,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right_1,
                                    color: AppColors.tertiaryText,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 170.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 183, 255),
                        borderRadius: BorderRadius.circular(22.sp),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22.sp),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    234,
                                    198,
                                    255,
                                  ),
                                  borderRadius: BorderRadius.circular(25.r),
                                  border: BoxBorder.all(
                                    color: const Color.fromARGB(
                                      255,
                                      229,
                                      183,
                                      255,
                                    ),
                                    width: 1.w,
                                  ),
                                ),
                                child: Icon(
                                  Iconsax.edit,
                                  color: AppColors.tertiaryText,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Edit note",
                                    style: TextStyle(
                                      color: AppColors.tertiaryText,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right_1,
                                    color: AppColors.tertiaryText,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Notes"),
                TextButton(onPressed: () {}, child: Text("View all")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}