abstract class Headers {
  Map<String, String> get headers;
}

class HeadersApi extends Headers {
  static Map<String, String> getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
    };
  }

  @override
  Map<String, String> get headers => getHeaders();
}
