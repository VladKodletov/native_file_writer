import 'package:native_file_writer/features/file_writer/domain/entities/file_content_entity.dart';
import 'package:native_file_writer/features/file_writer/domain/repositories/file_writer_repository.dart';

class WriteToFileUseCase {
  final FileWriterRepository repository;

  WriteToFileUseCase(this.repository);

  Future<FileContentEntity> call(int counter) async {
    return await repository.writeToFile(counter);
  }
}
