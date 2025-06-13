

import 'package:bloc_practice/barrel.dart';
import 'package:bloc_practice/data/model/note_model.dart';


class NoteState extends Equatable {
  final ApiStatus status;
  final List<NoteModel> notes;
  final String? errorMessage;

  NoteState({
    this.status = ApiStatus.initialState,
    this.notes = const [],
    this.errorMessage,
  });

  NoteState copyWith({
    ApiStatus? status,
    List<NoteModel>? notes,
    String? errorMessage,
  }) {
    return NoteState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
 
  List<Object?> get props => [status, notes, errorMessage];
}
