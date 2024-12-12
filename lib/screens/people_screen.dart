import 'package:flutter/material.dart';
import 'package:star_what/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Personajes', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),)),
        backgroundColor: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 19, 24, 32)).primary,
      ),
      body: FutureBuilder<PeopleResponse>(

        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildPeopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(PeopleResponse peopleResponse) {
    
    return ListView.builder(
      itemCount: peopleResponse.results!.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network('https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg'),
            title: Text(peopleResponse.results![index].name!),
          ),
        );
      },
    );
    
  }
}