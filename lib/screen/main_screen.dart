import 'package:flutter/material.dart';
import 'package:sayohat/items/item_1.dart';
import 'package:sayohat/items/item_2.dart';
import 'package:sayohat/repository/repository.dart';
import 'package:sayohat/screen/detail_screen.dart';

import '../Place.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final PlacesRepository placesRepository = PlacesRepository();

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<String> categories = [
    "All",
    "Buxoro",
    "Surxondaryo",
    "Xorazm",
    "Samarqand",
    "Qashqadaryo",
    "Jizzax",
    "Toshkent"
  ];
  int categoryIndex = 0;

  List<Place> allPlaces = placesRepository.getPlaces();
  List<Place> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = List.from(allPlaces);
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = List.from(allPlaces);
      } else {
        filteredPlaces = allPlaces
            .where((place) =>
                place.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterByIndex(int index) {
    setState(() {
      categoryIndex = index;
      print("$index  index");
      switch (index) {
        case 1:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Buxoro").toList();
          break;
        case 2:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Surxondaryo").toList();
          break;
        case 3:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Xorazm").toList();
          break;
        case 4:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Samarqand").toList();
          break;
        case 5:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Qashqadaryo").toList();
          break;
        case 6:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Jizzax").toList();
          break;
        case 7:
          filteredPlaces =
              allPlaces.where((place) => place.id == "Toshkent").toList();
          break;
        default:
          filteredPlaces = List.from(allPlaces);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031F2B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8),
              child: Text(
                "Sayohat",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              cursorColor: Colors.grey,
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF263238),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Qidirish...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                _filterSearch(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      _filterByIndex(selectedIndex);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xFF5EDFFF) : Color(0xFF263238),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: isSelected ? Colors.black : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                      child: Text(
                        "Mashhur joylar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                reverseTransitionDuration:
                                    Duration(milliseconds: 150),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(data: allPlaces[index],hero:"${allPlaces[index].imageUrl}top"),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "${allPlaces[index].imageUrl}top",
                            child: ManzaraCard(
                              imageUrl: allPlaces[index].imageUrl,
                              title: allPlaces[index].title,
                              location: allPlaces[index].location,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8);
                      },
                      itemCount: allPlaces.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                      child: Text(
                        categories[categoryIndex],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(data: filteredPlaces[index],hero:"${allPlaces[index].imageUrl}bottom"),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "${allPlaces[index].imageUrl}bottom",
                          child: Item2(
                            imageUrl: filteredPlaces[index].imageUrl,
                            title: filteredPlaces[index].title,
                            location: filteredPlaces[index].location,
                          ),
                        ),

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 8);
                    },
                    itemCount: filteredPlaces.length,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
