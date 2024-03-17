import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Темна тема для додатку
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram',
            style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 35.0)), // Стилізація логотипу
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            margin: const EdgeInsets.all(8.0),
            // Використовуємо ListView для горизонтальної прокрутки
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6, // Кількість елементів у списку
              itemBuilder: (context, index) => StoryCircle(index: index),
            ),
          ),
          const Divider(),
          // Плейсхолдери для постів
          for (var i = 0; i < 4; i++) PostPlaceholder(i),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class StoryCircle extends StatelessWidget {
  final int index;

  const StoryCircle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.pink, width: 3.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
      ),
    );
  }
}

class PostPlaceholder extends StatelessWidget {
  final int index;

  const PostPlaceholder(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          'Пост #$index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
