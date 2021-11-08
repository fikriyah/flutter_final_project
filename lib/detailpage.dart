import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Whatever'),
        backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            Container(
              child: Image.network(image),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
