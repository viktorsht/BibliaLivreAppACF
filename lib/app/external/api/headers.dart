abstract class Headers {
  Map<String, String> get headers;
}

class HeadersApi extends Headers {
  static Map<String, String> getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  @override
  Map<String, String> get headers => getHeaders();
}
