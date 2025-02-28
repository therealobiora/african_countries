abstract class CountryEvent {}

class LoadCountries extends CountryEvent {}

class LoadCountryDetails extends CountryEvent {
  final String countryName;
  LoadCountryDetails(this.countryName);
}
