// lib/screens/note_form_screen.dart
import 'package:bloc_practice/BLoC/local_notes_bloc/local_notes_bloc.dart';
import 'package:bloc_practice/BLoC/local_notes_bloc/local_notes_event.dart';
import 'package:bloc_practice/data/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NoteFormScreen extends StatefulWidget {
  final NoteModel? note;
  const NoteFormScreen({super.key, this.note});

  @override
  State<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (widget.note == null) {
        // Add new note
        context.read<NoteBloc>().add(
              AddNote(
                title: _titleController.text,
                content: _contentController.text,
              ),
            );
      } else {
        // Update existing note
        context.read<NoteBloc>().add(
              UpdateNote(
                id: widget.note!.id!,
                title: _titleController.text,
                content: _contentController.text,
              ),
            );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter content' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: Text(
                  widget.note == null ? 'Add Note' : 'Update Note',
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
