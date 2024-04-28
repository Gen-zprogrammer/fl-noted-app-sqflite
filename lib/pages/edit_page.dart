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
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
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
              height: 16,
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
              height: 16,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
              id: widget.note.id,
              title: titleController.text,
              content: contentController.text,
              createdAt: DateTime.now(),
            );
            LocalDataSource().updateNoteById(note);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          }
        },
        child: Icon(
          Icons.save,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
