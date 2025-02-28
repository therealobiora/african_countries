class Country {
  final String name;
  final String capital;
  final String flagUrl;
  final Map<String, dynamic> languages;

  Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Unknown', // Extract name
      capital:
          (json['capital'] as List?)?.first ?? 'No Capital', // Extract capital
      flagUrl: json['flags']['png'] ?? '', // Extract flag image URL
      languages: json['languages'] ?? {}, // Extract languages
    );
  }
}
