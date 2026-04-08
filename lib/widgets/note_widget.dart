import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:take_note/models/note.dart';
import 'package:take_note/utils/app_colors.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final DataController dataController;
  const NoteWidget({
    super.key,
    required this.note,
    required this.dataController,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.id!),
      confirmDismiss: (direction) async {
        switch (direction) {
          case DismissDirection.endToStart:
            return true; // allow delete swipe

          case DismissDirection.startToEnd:
            Get.toNamed('/notes', arguments: {'isEdit': true, 'toEdit': note});
            return false; // do not remove item

          default:
            return false;
        }
      },
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          await dataController.deleteTaskItemToServer(note);
        }
      },
      background: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Iconsax.edit), Icon(Iconsax.trash)],
          ),
        ),
      ),
      child: Container(
        height: 90.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(22.sp),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(22.sp),
          onTap: () {
            Get.toNamed('/notes', arguments: {'isEdit': true, 'toEdit': note});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 187, 255),
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: const Color.fromARGB(255, 210, 143, 255),
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Iconsax.note,
                      color: AppColors.tertiaryText,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    note.title,
                    style: TextStyle(color: AppColors.tertiaryText),
                  ),
                ],
              ),
              Icon(
                Iconsax.arrow_right_1,
                color: AppColors.tertiaryText,
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}