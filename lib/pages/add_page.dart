import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Page',
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
            ElevatedButton(
              onPressed: () {
               if(_formKey.currentState!.validate()){}
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
