import 'package:flutter/material.dart';
import 'detail_novel.dart';  // Import the DetailNovel widget
import 'package:novel_app/model/data.dart';  // Import your data model

class ContentNovel extends StatelessWidget {
  const ContentNovel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final DataNovel data = DataNovelList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailNovel(data: data);
            }));
          },
          child: Hero(
            tag: data.title,  
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      data.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data.title,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: DataNovelList.length,
    );
  }
}
