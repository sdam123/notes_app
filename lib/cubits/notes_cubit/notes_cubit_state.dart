part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesCubitlooding extends NotesCubitState {}

final class NotesCubitSuccess extends NotesCubitState {}

final class NotesCubitfailur extends NotesCubitState {
  final String errMessege;

  NotesCubitfailur({required this.errMessege});
}
