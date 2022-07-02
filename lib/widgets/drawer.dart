import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/recycle_bin.dart';
import 'package:todo_app/services/color_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.deepPurpleAccent.shade700,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.5, horizontal: 20.0),
              child: const Text(
                'Todo Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    Icons.folder_special,
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorService.grey,
                    ),
                    child: Text(
                      state.todoList.length >= 999
                          ? '${state.todoList.length}'
                          : '999+',
                      style: TextStyle(
                        color: ColorService.main,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, HomePage.id),
                );
              },
            ),
            Divider(color: Colors.deepPurpleAccent.shade700),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                  title: const Text(
                    'Bin',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    '${state.deletedList.length}',
                    style: TextStyle(
                      color: ColorService.main,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, RecycleBin.id),
                );
              },
            ),
            Divider(color: Colors.deepPurpleAccent.shade700),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    Icons.nights_stay,
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                  title: const Text(
                    'Night Mode',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: null,
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
