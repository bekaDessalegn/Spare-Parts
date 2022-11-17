import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:http/http.dart' as http;

class PaginationScreen extends StatefulWidget {
  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  final int _limit = 10;

  bool _isFirstLoading = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  List _posts = [];

  int numberOfPages = 10;

  int currentPage = 1;

  NumberPaginatorController numberPaginatorController =
      NumberPaginatorController();

  void _firstLoad() async {
    setState(() {
      _isFirstLoading = true;
    });

    setState(() {
      _isLoadMoreRunning = true;
    });

    try {
      print("The current page is: $currentPage");
      final res = await http
          .get(Uri.parse("$_baseUrl?_page=$currentPage&_limit=$_limit"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (e) {
      print("Something went wrong");
    }

    setState(() {
      _isFirstLoading = false;
    });
    setState(() {
      _isLoadMoreRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoading == false &&
        _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      try {
        print("The current page is: $currentPage");
        final res = await http
            .get(Uri.parse("$_baseUrl?_page=$currentPage&_limit=$_limit"));
        final List fetchedPosts = json.decode(res.body);

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts = json.decode(res.body);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        print("Something went wrong");
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    _firstLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages + 1,
        (index) => Center(
              child: Column(
                children: [
                  Text(
                    "Page Number: ${index}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _posts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: ListTile(
                              title: Text(_posts[index]['title']),
                              subtitle: Text(_posts[index]['body']),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination"),
      ),
      body: Column(
        children: [
          _isLoadMoreRunning == true
              ? Expanded(
                  child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ))
              : Expanded(
                  child: Container(
                  child: pages[currentPage],
                )),
          NumberPaginator(
            controller: numberPaginatorController,
            numberPages: numberOfPages,
            config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: Colors.orange,
                buttonSelectedForegroundColor: Colors.white,
                buttonUnselectedForegroundColor: Colors.orange),
            onPageChange: (index) {
              print("The index is $index");
              setState(() {
                currentPage = index + 1;
                print(currentPage);
              });
              _loadMore();
            },
          )
        ],
      ),
    );
  }
}
