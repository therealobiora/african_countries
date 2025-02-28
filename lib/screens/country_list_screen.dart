import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/country_bloc.dart';
import '../blocs/country_state.dart';
import '../widgets/country_tile.dart';
import 'country_details_screen.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("African Countries")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.blue));
            } else if (state is CountryLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    final country = state.countries[index];
                    return CountryTile(
                      country: country,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CountryDetailScreen(country: country),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            } else if (state is CountryError) {
              return Center(
                  child: Text(state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 16)));
            }
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          },
        ),
      ),
    );
  }
}
