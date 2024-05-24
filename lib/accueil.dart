import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final TextEditingController _searchController = TextEditingController();

  List goals = [
    {"icon": Icons.health_and_safety, 'title': 'Gain'},
    {"icon": Icons.balance, 'title': 'Maintain'},
    {"icon": Icons.handyman, 'title': 'Loss'},
    {"icon": Icons.sports_gymnastics, 'title': 'Gym'},
    {"icon": Icons.sports_football, 'title': 'Athlete'},
  ];

  List diets = [
    {"image": "images/gain.jpg", "title": "Gain", "desc": "Gain weight!"},
    {
      "image": "images/happy_sportif.jpg",
      "title": "Maintain",
      "desc": "Maintain weight!"
    },
    {"image": "images/sportif.jpg", "title": "Loss", "desc": "Loss weight!"},
    {
      "image": "images/bodybuilder.jpg",
      "title": "Gym",
      "desc": "Bodybuilding!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.0, // Set the height of the search field
                      decoration: BoxDecoration(
                        color: Colors
                            .grey[200], // Set the background color to grey
                        borderRadius:
                            BorderRadius.circular(40.0), // Rounded corners
                      ),

                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Search',
                          border: InputBorder.none, // Remove the border
                          enabledBorder: InputBorder
                              .none, // Remove the underline when enabled
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: const Text(
                "What is your goal?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Container(height: 20),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: goals.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(goals[i]['icon'], size: 40.0),
                          padding: EdgeInsets.all(15),
                        ),
                        Text(
                          goals[i]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: const Text(
                "Best Diets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Container(height: 20),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 175,
                              child: Image.asset(
                                diets[i]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                diets[i]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                diets[i]['desc'],
                                style: TextStyle(fontSize: 12.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: const Text(
                "Special Diet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Container(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulaire',
                    arguments: userData);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Request Diet from Nutritionist: 25\$',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
