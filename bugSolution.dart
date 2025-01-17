```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors separately
    print('JSON decoding error: $e');
    rethrow; //Re-throw
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw the exception to be handled higher up
  }
}
```