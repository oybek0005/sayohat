import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sayohat/Place.dart';

class DetailScreen extends StatefulWidget {
  final Place data;
  final String hero;

  const DetailScreen({super.key, required this.data,required this.hero});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031F2B),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFF021822),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.data.title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.hero,
                    child: Image.network(
                      widget.data.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Batafsil",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.data.description,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          MapsLauncher.launchCoordinates(
                              widget.data.lat, widget.data.long);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF5EDFFF),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.map_outlined,
                                    color: Color(0xFF5EDFFF)),
                                Text(
                                  "Joylashuv",
                                  style: TextStyle(color: Color(0xFF5EDFFF)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
