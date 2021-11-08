import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_final_project/createpage.dart';
import 'package:flutter_final_project/detailpage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PostsPage extends StatefulWidget {
  final WebSocketChannel channel;
  const PostsPage({
    Key? key,
    required this.channel,
    title,
  }) : super(key: key);

  State<StatefulWidget> createState() {
    return _PostsPageState(channel);
  }
}

class _PostsPageState extends State<PostsPage> {
  _PostsPageState(this.channel);
  WebSocketChannel channel;
  // late final String title;
  // late final String imageUrl;
  // late final String description;
  List posts = [];

  void getPosts() {
    channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      setState(() {
        posts = decodedMessage['data']['posts'];
      });
    });

    channel.sink.add('{"type": "get_posts"}');
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext item) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Whatever'),
          backgroundColor: Colors.red[400],
        ),
        body: StreamBuilder(
            //stream: widget.channel.stream,
            builder: (context, snapshot) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: TextButton(
                        child: const Icon(Icons.sort_by_alpha_outlined),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: TextButton(
                        child: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              description: posts[index]
                                                  ['description'],
                                              image: posts[index]['image'],
                                              title: posts[index]['title'],
                                              name: posts[index]['author'],
                                            )),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: Image.network(
                                          posts[index]['image'],
                                          width: 300,
                                          height: 150,
                                          fit: BoxFit.fill),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${posts[index]["title"].toString().characters.take(20)}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          TextButton(
                                            child: const Icon(Icons.favorite),
                                            onPressed: () {},
                                          ),
                                          TextButton(
                                            child: const Icon(Icons.delete),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${posts[index]["description"].toString().characters.take(40)}',
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreatePage(channel: channel)),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.red[400],
        ),
      ),
    );
  }
}


// class PostsPage extends StatefulWidget {
//   const PostsPage({Key? key}) : super(key: key);

//   @override
//   _PostsPageState createState() => _PostsPageState();
// }

// class _PostsPageState extends State<PostsPage> {
//   late WebSocketChannel channel;

//   @override
//   initState() {
//     super.initState();
//     channel.stream.listen((message) {
//       final decodedResults = jsonDecode(message);
//       if (decodedResults['type'] == 'all_posts') {
//         final posts = decodedResults['data']['posts'];
//       }
//       setState(() {});
//     });
//     PostsPage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Whatever'),
//           backgroundColor: Colors.red[400],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, posts) {
//                   return Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             child: TextButton(
//                               child: const Icon(Icons.sort_by_alpha_outlined),
//                               onPressed: () {},
//                             ),
//                           ),
//                           Container(
//                             child: TextButton(
//                               child: const Icon(Icons.favorite),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.all(8.0),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8.0))),
//                           child: InkWell(
//                             onTap: () => print("ciao"),
//                             child: Column(
//                               children: <Widget>[
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(8.0),
//                                     topRight: Radius.circular(8.0),
//                                   ),
//                                   child: Image.network(
//                                       'https://upload.wikimedia.org/wikipedia/commons/c/cf/Monki_logo.png',
//                                       width: 300,
//                                       height: 150,
//                                       fit: BoxFit.fill),
//                                 ),
//                                 ListTile(
//                                   title: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           "Title",
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                         ),
//                                       ),
//                                       TextButton(
//                                         child: const Icon(Icons.favorite),
//                                         onPressed: () {},
//                                       ),
//                                       TextButton(
//                                         child: const Icon(Icons.delete),
//                                         onPressed: () {},
//                                       ),
//                                     ],
//                                   ),
//                                   subtitle: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           'Description',
//                                           maxLines: 2,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CreatePage()),
//             );
//           },
//           child: const Icon(Icons.add),
//           backgroundColor: Colors.red[400],
//         ),
//       ),
//     );
//   }
// }
