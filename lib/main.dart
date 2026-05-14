import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/di/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/posts/presentation/bloc/post_list_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getDependency<AuthBloc>()..add(const AuthStarted()),
        ),
        BlocProvider<PostListBloc>(
          create: (_) => getDependency<PostListBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
