import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_file_writer/features/file_writer/domain/usecases/write_to_file_usecase.dart';

part 'file_writer_event.dart';
part 'file_writer_state.dart';

class FileWriterBloc extends Bloc<FileWriterEvent, FileWriterState> {
  final WriteToFileUseCase writeToFileUseCase;
  int _counter = 0;

  FileWriterBloc({required this.writeToFileUseCase}) 
      : super(const FileWriterInitial()) {
    on<WriteToFileEvent>(_onWriteToFileEvent);
  }

  Future<void> _onWriteToFileEvent(
    WriteToFileEvent event,
    Emitter<FileWriterState> emit,
  ) async {
    emit(const FileWriterLoading());
    
    try {
      _counter++;
      final result = await writeToFileUseCase(_counter);
      emit(FileWriterSuccess(
        fileContent: result.content,
        counter: result.counter,
      ));
    } catch (e) {
      emit(FileWriterError(e.toString()));
    }
  }
}