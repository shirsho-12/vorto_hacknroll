import 'package:dio/dio.dart';

class SummarizerRestClient {
  // MeaningCloud Summarization API 1.0
  final String endpoint;
  final Map<String, String> data;

  SummarizerRestClient({
    required this.endpoint,
    this.data = const {},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: 'https://api.meaningcloud.com/',
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      // headers: {

      // },
    ),
  );

  Future<String> getSummaryFromFile(String filePath) async {
    final response = await _client.post(
      endpoint,
      data: {
        // 'doc': filePath,
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'doc': "assets.pdf",
        'lang': "en",
        // 'limit': '0.3',
        'sentences': '6',
      },
    );
    print(response);
    if (response.statusCode != 200) {
      throw Exception('Failed to get summary');
    }

    return response.data['summary'];
  }

  Future<String> getSummaryFromFileWithLimit(
      String filePath, String limit) async {
    // Limit is a positive integer between 1 and 100 denoting the percentage of
    // sentences to be included in the summary.
    final response = await _client.post(
      endpoint,
      data: {
        'doc': filePath,
        'limit': limit,
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'lang': "en",
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to get summary');
    }

    return response.data['summary'];
  }

  Future<String> getSummaryFromText(String text) async {
    final response = await _client.post(
      endpoint,
      data: {
        'txt': text,
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'lang': "en",
        'sentences': '6',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to get summary');
    }

    return response.data['summary'];
  }

  Future<String> getSummaryFromUrl(String url) async {
    final response = await _client.post(
      endpoint,
      data: {
        'url': url,
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'lang': "en",
        'sentences': '6',
      },
    );
    print(response);

    if (response.statusCode != 200) {
      throw Exception('Failed to get summary');
    }

    return response.data['summary'];
  }
}

void main(List<String> args) {
  final summarizer = SummarizerRestClient(endpoint: '/summarization-1.0');
  summarizer
      .getSummaryFromFile(
          'https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm')
      .then((summary) {
    print(summary);
  });
}
