enum EService { loremService }

class ApiEndpoint {
  static const Map<EService, String> baseUrl = {
    EService.loremService: 'https://lorem-api.com/api',
  };

  static const Map<EService, Map<String, String>> servicePath = {
    EService.loremService: {'jwt': 'jwt'},
  };

  static Uri apiBuilder({
    required EService service,
    String path = '',
    String queryParams = '',
  }) {
    final String apiUrl = ApiEndpoint.baseUrl[service]!;
    final String servicePath =
        path.isNotEmpty ? '/${ApiEndpoint.servicePath[service]![path]}' : '';
    final String queryParamsPath =
        queryParams.isNotEmpty ? '?$queryParams' : '';
    return Uri.parse('$apiUrl$servicePath$queryParamsPath');
  }
}
