class FileContentEntity {
  final String content;
  final int counter;

  const FileContentEntity({
    required this.content,
    required this.counter,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileContentEntity &&
        other.content == content &&
        other.counter == counter;
  }

  @override
  int get hashCode => content.hashCode ^ counter.hashCode;
}