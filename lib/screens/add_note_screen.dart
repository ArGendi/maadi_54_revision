// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_18/local/database_services.dart';
import 'package:flutter_application_18/screens/notes_screen.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen()));
            }, 
            icon: Icon(Icons.notes),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: "Content",
                  prefixIcon: Icon(Icons.note),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    DatabaseServices dbservices = DatabaseServices();
                    String t = titleController.text;
                    String c = contentController.text;
                    dbservices.insert(t, c);
                    titleController.clear();
                    contentController.clear();
                  }, 
                  child: Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}