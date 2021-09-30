import 'package:flutter/material.dart';

class MyCourseHomePage extends StatelessWidget {
  // const MyCourseHomePage({Key? key}) : super(key: key);
  final String JsonTitle;
  final String JsonCont;
  final String JsonContentImg;
  final String JsonContentDesc;
  final String JsonMod;
  const MyCourseHomePage ({
    this.JsonTitle="",
    this.JsonCont="",
    this.JsonContentImg="",
    this.JsonContentDesc="",
    this.JsonMod="",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(JsonTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                JsonTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("last time modified: $JsonMod",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(JsonContentImg),
            ),
            Expanded(
              child: Text(JsonContentDesc),
            ),
          ],
        ),
      ),
    );
  }
}