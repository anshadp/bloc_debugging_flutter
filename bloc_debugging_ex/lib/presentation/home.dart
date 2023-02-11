import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Joke App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ExpansionTile(
              title: Text(
                "Joke",
                textAlign: TextAlign.center,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                //TODO Load New Joke
              },
              child: const Text('Load New Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
