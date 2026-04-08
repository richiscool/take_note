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
  final bool isEdit;
  final Note? toEdit;

  const NoteScreen({super.key, required this.isEdit, this.toEdit});

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
  void initState() {
    if (widget.isEdit) {
      noteController.text = widget.toEdit!.content;
      titleController.text = widget.toEdit!.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (widget.isEdit) {
              await _saveNote();
            }
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
            onPressed: _isSaving
                ? null
                : () async {
                    _saveFailed = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (await _saveNote()) {
                      await Future.delayed(
                        const Duration(milliseconds: 250),
                      ).then(onSaveSuccess);
                    }
                  },
            icon: _isSaving
                ? SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(
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
                maxLines: null,

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

  void onSaveSuccess(_) {
    Get.back();
  }

  Future<bool> _save(Note note) async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    try {
      setState(() {
        _isSaving = true;
      });

      if (widget.isEdit) {
        return await _dataController.updateTaskItemToServer(note);
      } else {
        return await _dataController.putTaskItemsToServer(note);
      }
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

  Future<bool> _saveNote() async {
    if (widget.isEdit) {
      if (titleController.text != widget.toEdit!.title ||
          noteController.text != widget.toEdit!.content) {
        var note = widget.toEdit!;
        note.content = noteController.text;
        note.title = titleController.text;
        return await _save(note);
      }
      return true;
    } else {
      Note note = Note(
        title: titleController.text,
        content: noteController.text,
        createdAt: DateTime.now(),
      );
      return await _save(note);
    }
  }
}