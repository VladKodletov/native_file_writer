
import 'package:native_file_writer/features/file_writer/domain/entities/file_content_entity.dart';

abstract class FileWriterRepository {
  Future<FileContentEntity> writeToFile(int counter);
}