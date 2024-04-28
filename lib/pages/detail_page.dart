// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_sqlite_noted_app/data/datasources/local_datasource.dart';
import 'package:fl_sqlite_noted_app/pages/home_page.dart';
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
        leading: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Note'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await LocalDataSource()
                              .deleteNoteById(widget.note.id!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
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
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
