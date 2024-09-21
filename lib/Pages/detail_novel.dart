import 'package:flutter/material.dart';
import 'package:novel_app/model/data.dart';  // Import your data model

class DetailNovel extends StatefulWidget {
  final DataNovel data;

  DetailNovel({required this.data});

  @override
  _DetailNovelState createState() => _DetailNovelState();
}

class _DetailNovelState extends State<DetailNovel> {
  bool like = false;
  bool unlike = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        title: Text(widget.data.title),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4F4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Hero(
                    tag: widget.data.title,
                    child: Container(
                      height: 200,
                      width: 150,
                      child: Material(
                        elevation: 15.0,
                        shadowColor: Colors.grey.shade500,
                        child: Image.asset(
                          widget.data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.title,
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Rating: ${widget.data.rating}', style: TextStyle(color: Colors.white, fontSize: 18)),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('Author: ${widget.data.author}', style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(height: 10),
                        Text('Genre: ${widget.data.genre1}, ${widget.data.genre2}', style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(height: 10),
                        Text('Status: ${widget.data.status}', style: TextStyle(color: Colors.orange, fontSize: 16)),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                          child: Text('READ NOW', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ReadNovel(data: widget.data);
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (unlike == true) {
                            like = false;
                          } else {
                            like = !like;
                          }
                        });
                      },
                      icon: Icon(
                        like ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (like == true) {
                            unlike = false;
                          } else {
                            unlike = !unlike;
                          }
                        });
                      },
                      icon: Icon(
                        unlike ? Icons.thumb_down : Icons.thumb_down_outlined,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Sinopsis', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.data.sinopsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ReadNovel(data: widget.data);
                  }));
                },
                child: Card(
                  color: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.data.chapter, style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text(widget.data.date, style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadNovel extends StatelessWidget {
  final DataNovel data;

  ReadNovel({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4F4F),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  data.chapter,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                data.content,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
