import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  bool _isLiked = false;

  void _likePost() {
    setState(() {
      _isLiked = !_isLiked;
    });
    debugPrint("Like button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            _isLiked ? "Post has been liked" : "Post not liked",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          /* elevation: 15,
          shadowColor: Colors.amber, */
        ),

        body: Center(
          child: IconButton(
            onPressed: _likePost,
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              size: 100,
            ),
            color: _isLiked ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }
}
