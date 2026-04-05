import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/models/note.dart';
import 'package:take_note/utils/app_colors.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final DataController _dataController = Get.put(DataController());
  final ViewController _viewController = Get.put(ViewController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _saveFailed = false;
  var _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Iconsax.arrow_left),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.export, size: 30.sp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.tick_circle,
              color: AppColors.binanceGold,
              size: 30.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLines: 1,
                controller: titleController,
                style: TextStyle(fontSize: 25.sp),
                decoration: InputDecoration.collapsed(hintText: "Title"),
                validator: (value) {
                  if (value != null && value.length <= 2) {
                    return "Title is too short";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextFormField(
                maxLines: 8,
                controller: noteController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 20.sp),
                decoration: InputDecoration.collapsed(
                  hintText: "Start entering your note here...",
                ),
                validator: (value) {
                  if (value != null && value.length <= 4) {
                    return "Note is too short";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _saveNote() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    try {
      setState(() {
        _isSaving = true;
      });

      Note note = Note(
        title: titleController.text,
        content: noteController.text,
        createdAt: DateTime.now(),
      );
      _dataController.notes.add(note);
      return await _dataController.serializeNote();
    } catch (_) {
      _saveFailed = true;
      await Future.delayed(const Duration(milliseconds: 250));
      setState(() {
        _isSaving = false;
      });
      _formKey.currentState!.validate();
      return false;
    }
  }
}