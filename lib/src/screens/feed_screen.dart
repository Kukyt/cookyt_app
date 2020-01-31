import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';

class FeedScreen extends StatefulWidget {
  static const String id = 'feed_screen';

  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
  final AuthManager auth = Provider.of(context).fetch(AuthManager);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Feed Screen',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              color: Colors.cyan,
              child: Text('Go to profile Screen'),
              onPressed: () => Navigator.pushNamed(context, ProfileScreen.id),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_gas_station),
        onPressed: () => auth.logOut(context),
      ),
    );
  }
}
