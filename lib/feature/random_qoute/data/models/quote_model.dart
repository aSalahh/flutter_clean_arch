import 'package:clean_arch/feature/random_qoute/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required id,
      required content,
      required author,
      required dateAdded,
      required dateModified})
      : super(
            author: author,
            dateModified: dateModified,
            dateAdded: dateAdded,
            content: content,
            id: id);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "author": author,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };
}
