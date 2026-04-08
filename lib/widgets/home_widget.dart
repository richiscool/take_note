import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/utils/app_colors.dart';
import 'package:take_note/utils/helper.dart';
import 'package:take_note/widgets/note_widget.dart';

class HomeWidget extends StatefulWidget {
  final DataController dataController;
  final ViewController viewController;
  final void Function(int) onViewAll;

  const HomeWidget({
    super.key,
    required this.dataController,
    required this.viewController,
    required this.onViewAll,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                                Get.toNamed(
                                  '/notes',
                                  arguments: {'isEdit': false, 'toEdit': null},
                                );
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
                      noteMenu(
                        "View Note",
                        Iconsax.activity,
                        Color.fromARGB(255, 187, 182, 255),
                        Color.fromARGB(255, 203, 199, 255),
                        widget.dataController.notes.isEmpty
                            ? null
                            : () {
                                Get.toNamed(
                                  '/notes',
                                  arguments: {
                                    'isEdit': true,
                                    'toEdit': widget.dataController.notes.first,
                                  },
                                );
                              },
                      ),
                      SizedBox(height: 10.h),
                      noteMenu(
                        "Edit Note",
                        Iconsax.edit,
                        Color.fromARGB(255, 229, 183, 255),
                        Color.fromARGB(255, 234, 198, 255),
                        widget.dataController.notes.isEmpty
                            ? null
                            : () {
                                Get.toNamed(
                                  '/notes',
                                  arguments: {
                                    'isEdit': true,
                                    'toEdit': widget.dataController.notes.last,
                                  },
                                );
                              },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Notes"),
                  TextButton(
                    onPressed: () {
                      widget.onViewAll(1);
                    },
                    child: Text("View all"),
                  ),
                ],
              ),
              ...getTopNotes(),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> getTopNotes() {
    List<Widget> notes = List.empty(growable: true);
    if (widget.dataController.notes.isEmpty) {
      notes.add(emptyNoteView(context));
    } else {
      for (int i = 0; i < widget.dataController.notes.length; ++i) {
        notes.add(
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: NoteWidget(
              note: widget.dataController.notes[i],
              dataController: widget.dataController,
            ),
          ),
        );
        if (i == 2) {
          break;
        }
      }
    }
    return notes;
  }

  Widget noteMenu(
    String title,
    IconData icon,
    Color primary,
    Color secondary,
    void Function()? onTap,
  ) {
    return Container(
      width: 170.w,
      height: 125.h,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22.sp),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(25.r),
                  border: BoxBorder.all(color: primary, width: 1.w),
                ),
                child: Icon(icon, color: AppColors.tertiaryText, size: 20.sp),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(title, style: TextStyle(color: AppColors.tertiaryText)),
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
    );
  }
}