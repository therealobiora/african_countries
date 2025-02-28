import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/country_repository.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository repository;

  CountryBloc(this.repository) : super(CountryInitial()) {
    on<LoadCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await repository.fetchCountries();
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError("Failed to fetch countries"));
      }
    });

    on<LoadCountryDetails>((event, emit) async {
      emit(CountryLoading());
      try {
        final country = await repository.fetchCountryDetails(event.countryName);
        emit(CountryDetailsLoaded(country));
      } catch (e) {
        emit(CountryError("Failed to load country details"));
      }
    });
  }
}
