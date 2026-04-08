import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:take_note/controllers/data_controller.dart';
import 'package:take_note/controllers/view_controller.dart';
import 'package:take_note/utils/helper.dart';
import 'package:take_note/widgets/note_widget.dart';

class NoteDisplayWidget extends StatefulWidget {
  final DataController dataController;
  final ViewController viewController;
  const NoteDisplayWidget({
    super.key,
    required this.dataController,
    required this.viewController,
  });

  @override
  State<NoteDisplayWidget> createState() => _NoteDisplayWidgetState();
}

class _NoteDisplayWidgetState extends State<NoteDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: widget.dataController.notes.isEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
                child: emptyNoteView(context),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Column(children: getNotes()),
              ),
      );
    });
  }

  List<Widget> getNotes() {
    List<Widget> notes = List.empty(growable: true);

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
    }
    return notes;
  }
}