import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';

import 'package:note_app/widgets/add_note_form.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottomSheet extends StatefulWidget {
  AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
        if (state is AddNotesFailure) {}
        if (state is AddNotesSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNotesLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
              child: AddNotesForm(),
            ),
          ),
        );
      }),
    );
  }
}
