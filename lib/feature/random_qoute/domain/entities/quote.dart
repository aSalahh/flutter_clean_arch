import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String content;
  final String id;
  final String author;
  final DateTime dateAdded;
  final DateTime dateModified;

  const Quote(
      {required this.content,
      required this.id,
      required this.author,
      required this.dateAdded,
      required this.dateModified});

  @override
  List<Object?> get props => [author, id, content, dateAdded, dateModified];
}
