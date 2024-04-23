import 'package:fl_sqlite_noted_app/pages/edit_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Note',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Title',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Content',
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditPage(),
            ),
          );
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
