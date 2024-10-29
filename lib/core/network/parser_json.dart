typedef Parser<T> = T Function(dynamic json);

class ParserJson<T> {
  String? errors;
  late T data;

  ParserJson.fromJson(Map<String, dynamic> json, Parser<T> parser) {
    // errors = json['errors'] ?? "";
    data = parser(json['data']);
  }

  ParserJson(this.errors, this.data, );
}
