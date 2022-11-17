import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class ScrollPaginationScreen extends StatefulWidget {
  const ScrollPaginationScreen({Key? key}) : super(key: key);

  @override
  State<ScrollPaginationScreen> createState() => _ScrollPaginationScreenState();
}

class _ScrollPaginationScreenState extends State<ScrollPaginationScreen> {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  int _page = 0;

  final int _limit = 10;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300
    ) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });

      _page += 1; // Increase _page by 1

      try {
        final res =
        await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {

          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }


      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final res =
      await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;

  final itemController = ItemScrollController();
  final itemListener = ItemPositionsListener.create();
  int itemPosition = 0;
  int itemLast = 0;

  int scrollIndex = 0;

  void scrollListener(){
    itemListener.itemPositions.addListener(() {
      final indices = itemListener.itemPositions.value.map((e) => e.index).toList();

      setState(() {
        itemLast = indices.last;
      });
      print("Listening .....");
      // print(scrollIndex);
      // print(itemLast);
      print(indices);
      if(itemLast == scrollIndex - 1){
        print("Did it : $itemLast");
      }

    });
  }

  void somesing() async {

  }

  final String youtubeUrl = "https://www.youtube.com/watch?v=VQ1a4SuXIiw";

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();

    youtubePlayerController = YoutubePlayerController()..onInit = (){
        youtubePlayerController.cueVideoById(videoId: 'K18cpp_-gP8', startSeconds: 30);
    };

    scrollListener();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your news', style: TextStyle(color: Colors.white),),
        ),
        body:_isFirstLoadRunning?const Center(
          child: CircularProgressIndicator(),
        ):SingleChildScrollView(
          child: Column(
            children: [

              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height - 220,
                width: double.infinity,
              ),
              // Column(
              //   children: [
              //     ScrollablePositionedList.builder(
              //       itemScrollController: itemController,
              //       itemPositionsListener: itemListener,
              //       itemCount: _posts.length,
              //       itemBuilder: (_, index) {
              //         scrollIndex = _posts.length;
              //         return Card(
              //         margin: const EdgeInsets.symmetric(
              //             vertical: 8, horizontal: 10),
              //         child: ListTile(
              //           title: Text(_posts[index]['title']),
              //           subtitle: Text(_posts[index]['body']),
              //         ),
              //       );
              //       },
              //     ),
              //   ],
              // ),
              // if (_isLoadMoreRunning == true)
              //   const Padding(
              //     padding: EdgeInsets.only(top: 10, bottom: 40),
              //     child: Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   ),
              //
              // if (_hasNextPage == false)
              //   Container(
              //     padding: const EdgeInsets.only(top: 30, bottom: 40),
              //     color: Colors.amber,
              //     child: const Center(
              //       child: Text('You have fetched all of the content'),
              //     ),
              //   ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[400],
              )
            ],
          ),
        )
    );
  }
}