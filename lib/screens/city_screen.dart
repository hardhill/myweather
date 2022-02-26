import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (text) {
                    cityName = text;
                  },
                  cursorColor: Colors.blueGrey,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter city name',
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    icon: Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Get weather',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.pop(context, cityName);
              },
            )
          ]),
        ),
      ),
    );
  }
}
