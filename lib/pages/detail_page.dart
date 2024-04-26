// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fl_sqlite_noted_app/data/models/note.dart';
import 'package:fl_sqlite_noted_app/pages/edit_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

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
            widget.note.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.note.content,
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPage(
                note: widget.note,
              ),
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
