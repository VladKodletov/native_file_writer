import 'package:flutter/material.dart';

class FileContentDisplay extends StatelessWidget {
  final String content;

  const FileContentDisplay({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'File Content:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                content.isEmpty ? 'File is empty' : content,
                style: TextStyle(
                  fontSize: 14,
                  color: content.isEmpty ? Colors.grey : Colors.black87,
                  fontFamily: 'Monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
