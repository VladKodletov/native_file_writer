part of 'file_writer_bloc.dart';

abstract class FileWriterState extends Equatable {
  const FileWriterState();

  @override
  List<Object> get props => [];
}

class FileWriterInitial extends FileWriterState {
  const FileWriterInitial();
}

class FileWriterLoading extends FileWriterState {
  const FileWriterLoading();
}

class FileWriterSuccess extends FileWriterState {
  final String fileContent;
  final int counter;

  const FileWriterSuccess({
    required this.fileContent,
    required this.counter,
  });

  @override
  List<Object> get props => [fileContent, counter];
}

class FileWriterError extends FileWriterState {
  final String message;

  const FileWriterError(this.message);

  @override
  List<Object> get props => [message];
}