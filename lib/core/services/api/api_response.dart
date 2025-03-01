class ApiResponse {
  final dynamic data;
  final String? error;

  ApiResponse({this.data, this.error});

  bool get hasError => error != null;
}
