// lib/bloc/note_bloc.dart
import 'package:bloc_practice/BLoC/local_notes_bloc/local_notes_event.dart';
import 'package:bloc_practice/BLoC/local_notes_bloc/local_notes_state.dart';
import 'package:bloc_practice/data/db/database_helpr.dart';
import 'package:bloc_practice/data/model/note_model.dart';
import 'package:bloc_practice/utils/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: ApiStatus.loadingState));
    try {
      final notes = await DatabaseHelper.instance.getAllNotes();
      emit(state.copyWith(status: ApiStatus.successState, notes: notes));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.errorState, errorMessage: 'Failed to load notes'));
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    try {
      await DatabaseHelper.instance.insertNote(
        NoteModel(title: event.title, content: event.content),
      );
      add(LoadNotes());
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.errorState, errorMessage: 'Failed to add note'));
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    try {
      await DatabaseHelper.instance.updateNote(
        NoteModel(id: event.id, title: event.title, content: event.content),
      );
      add(LoadNotes());
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.errorState, errorMessage: 'Failed to update note'));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      await DatabaseHelper.instance.deleteNote(event.id);
      add(LoadNotes());
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.errorState, errorMessage: 'Failed to delete note'));
    }
  }
}
