import 'package:flutter/material.dart';



class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 50,
            mainAxisAlignment: .center,
            children: [
              TextField(
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: OutlineInputBorder(),
              ),
              ),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  labelText: 'Filled',
                  hintText: 'hint text',
                  helperText: 'supporting text',
                  filled: true,
                ),
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "password"
                ),
              ),

              TextField(
                controller: _controller,
                onSubmitted: (String value) async{
                  await showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Thank You!"),
                          content: Text('You typed "$value", which has length ${value.characters.length}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
