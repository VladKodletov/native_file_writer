import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/file_writer/data/datasources/native_file_writer_data_source.dart';
import 'features/file_writer/data/repositories/file_writer_repository_impl.dart';
import 'features/file_writer/domain/repositories/file_writer_repository.dart';
import 'features/file_writer/domain/usecases/write_to_file_usecase.dart';
import 'features/file_writer/presentation/bloc/file_writer_bloc.dart';
import 'features/file_writer/presentation/pages/file_writer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NativeFileWriterDataSource>(
          create: (_) => NativeFileWriterDataSourceImpl(),
        ),
        RepositoryProvider<FileWriterRepository>(
          create: (context) => FileWriterRepositoryImpl(
            dataSource: context.read<NativeFileWriterDataSource>(),
          ),
        ),
        RepositoryProvider<WriteToFileUseCase>(
          create: (context) => WriteToFileUseCase(
            context.read<FileWriterRepository>(),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => FileWriterBloc(
          writeToFileUseCase: context.read<WriteToFileUseCase>(),
        ),
        child: MaterialApp(
          title: 'Native File Writer',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: false,
          ),
          home: const FileWriterPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}