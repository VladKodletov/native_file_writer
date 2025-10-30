import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_file_writer/features/file_writer/presentation/bloc/file_writer_bloc.dart';
import 'package:native_file_writer/features/file_writer/presentation/widgets/counter_button.dart';
import 'package:native_file_writer/features/file_writer/presentation/widgets/file_content_display.dart';


class FileWriterPage extends StatelessWidget {
  const FileWriterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native File Writer'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<FileWriterBloc, FileWriterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.description,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Native File Writer Demo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tap the button to write to file via native iOS code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                CounterButton(
                  onPressed: () => context.read<FileWriterBloc>().add(const WriteToFileEvent()),
                  isLoading: state is FileWriterLoading,
                  counter: state is FileWriterSuccess ? state.counter : 0,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: FileContentDisplay(
                    content: state is FileWriterSuccess ? state.fileContent : 
                            state is FileWriterInitial ? 'Press the button to start' : 
                            state is FileWriterError ? 'Error: ${state.message}' : 
                            'Loading...',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}