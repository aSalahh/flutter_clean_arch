import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String content;
  final String id;
  final String author;
  final String dateAdded;
  final String dateModified;

  const Quote(
      {required this.content,
      required this.id,
      required this.author,
      required this.dateAdded,
      required this.dateModified});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
