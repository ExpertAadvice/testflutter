import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/ui/screens/login/authViewModel.dart';
import 'package:testflutter/ui/screens/splash/userViewModel.dart';
import 'package:testflutter/utils/route_utils/route_names.dart';
import 'package:testflutter/utils/route_utils/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteNames.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
