part of 'file_writer_bloc.dart';


abstract class FileWriterEvent extends Equatable {
  const FileWriterEvent();

  @override
  List<Object> get props => [];
}

class WriteToFileEvent extends FileWriterEvent {
  const WriteToFileEvent();
}