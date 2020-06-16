import 'package:flutter/material.dart';
import 'second_page.dart';
import 'func.dart';

void main() async {
  List _data = await getJSON();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('IMAGE`S APP'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _data.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  imageURL: _data[i]['urls']['regular'],
                                )),
                      );
                    },
                    child: Container(
                        child: Image.network(_data[i]['urls']['regular'],
                            fit: BoxFit.cover),
                        height: 110),
                  ),
                  Center(child: Text(_data[i]['alt_description'])),
                  Center(child: Text(_data[i]['user']['name'])),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}
