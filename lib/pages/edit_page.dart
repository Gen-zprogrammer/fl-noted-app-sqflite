// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_sqlite_noted_app/data/datasources/local_datasource.dart';
import 'package:fl_sqlite_noted_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:fl_sqlite_noted_app/data/models/note.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 8,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Content wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
              title: widget.note.title,
              content: widget.note.content,
              createdAt: DateTime.now(),
            );

            LocalDataSource().updateNoteById(note);
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        child: const Icon(
          Icons.save,
          size: 24.0,
        ),
      ),
    );
  }
}
