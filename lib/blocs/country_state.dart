import '../models/country_model.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;
  CountryLoaded(this.countries);
}

class CountryDetailsLoaded extends CountryState {
  final Country country;
  CountryDetailsLoaded(this.country);
}

class CountryError extends CountryState {
  final String message;
  CountryError(this.message);
}
