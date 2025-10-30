import 'package:native_file_writer/features/file_writer/data/datasources/native_file_writer_data_source.dart';
import 'package:native_file_writer/features/file_writer/domain/entities/file_content_entity.dart';
import 'package:native_file_writer/features/file_writer/domain/repositories/file_writer_repository.dart';

class FileWriterRepositoryImpl implements FileWriterRepository {
  final NativeFileWriterDataSource dataSource;

  FileWriterRepositoryImpl({required this.dataSource});

  @override
  Future<FileContentEntity> writeToFile(int counter) async {
    try {
      final content = await dataSource.writeToFileNative(counter);
      return FileContentEntity(content: content, counter: counter);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}