import 'package:flutter/material.dart';
class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text(
          'search Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
