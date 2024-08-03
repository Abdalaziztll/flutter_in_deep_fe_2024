// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReponseData {}

class DataSuccess extends ReponseData {}

class DataFailed extends ReponseData {
  String message;
  DataFailed({
    required this.message,
  });
}
