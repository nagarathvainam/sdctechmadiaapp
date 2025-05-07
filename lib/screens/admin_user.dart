import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sdctechmedia/users/bloc/admin_user_bloc.dart';
import 'package:sdctechmedia/users/bloc/admin_user_event.dart';
import 'package:sdctechmedia/users/bloc/admin_user_state.dart';

import '../users/services/admin_user_api.dart';



class AdminUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => AdminUserBloc(AdminUserApi())..add(LoadUsers()),
        child: AdminUserPage(),
      ),
    );
  }
}

class AdminUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Users')),
      body: BlocBuilder<AdminUserBloc, AdminUserState>(
        builder: (context, state) {
          if (state is AdminUserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AdminUserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Slidable(
                  key: ValueKey(user.id),
                  startActionPane: ActionPane(
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) {}, // Add edit logic
                        icon: Icons.edit,
                        backgroundColor: Colors.blue,
                      ),
                      SlidableAction(
                        onPressed: (_) => context.read<AdminUserBloc>().add(DeleteUser(user.id)),
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      ),
                      SlidableAction(
                        onPressed: (_) {}, // Add view logic
                        icon: Icons.visibility,
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(user.fullname),
                    subtitle: Text(user.email),
                  ),
                );
              },
            );
          } else if (state is AdminUserError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}