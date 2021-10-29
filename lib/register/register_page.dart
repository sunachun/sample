import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_list/domain/book.dart';
import 'package:sample_list/register/register_model.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録'),
        ),
        body: Center(
          child: Consumer<RegisterModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: model.titleController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    onChanged: (text) {
                      model.setEmail(text);
                    },
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: model.authorController,
                    decoration: InputDecoration(
                      hintText: 'password',
                    ),
                    onChanged: (text) {
                      model.setPassword(text);
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await model.signUp();
                        //Navigator.of(context).pop(model.title);
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text('登録する'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
