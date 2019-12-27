import 'package:cookyt_app/src/Widgets/user_description.dart';
import 'package:cookyt_app/src/models/user.dart';
import 'package:cookyt_app/src/styles/profile_page_styles.dart';
import 'package:flutter/material.dart';
import '../Mock/current_user.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _displayPosts;
  List<String> images;
  User user;

  @override
  void initState() {
    super.initState();
    _displayPosts = 0;
    user = currentUser;
    images = userUrlPosts;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          _background(),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(child: SizedBox(height: 5.0)),
              _topAppBar(size),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _profileRow(size),
                    SizedBox(height: 14.0),
                    _bio(user.name, user.description),
                    _greenDivider(size),
                    SizedBox(height: 10.0),
                    _followsAndPostsInfo(user),
                    SizedBox(height: 10.0),
                    _greenDivider(size),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 10.0),
                sliver: SliverToBoxAdapter(
                  child: _buildToggleButtons(),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                children: images.map((url) => _recipePhoto(size, url)).toList(),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _greenDivider(Size size) {
    return Center(
      child: Container(
        width: size.width - size.width * 0.2,
        child: Divider(
          color: Theme.of(context).accentColor,
          height: 0.0,
          thickness: 1.0,
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  Widget _topAppBar(size) {
    return SliverAppBar(
      expandedHeight: size.height * 0.1,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
        iconSize: 40.0,
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        user.nickName,
        style: nickNameStyle,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.message,
            color: Theme.of(context).primaryColor,
            size: 40.0,
          ),
        ),
      ],
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      pinned: false,
    );
  }

  Widget _profileRow(size) {
    return Container(
      width: size.width,
      height: 170,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _bestFoodPhoto(
                    width: 70.0,
                    height: 70.0,
                    path: 'assets/images/comida.jpeg',
                  ),
                  _bestFoodPhoto(
                    width: 70.0,
                    height: 70.0,
                    path: 'assets/images/comida1.jpg',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: _profilePhoto(
              width: 170.0,
              height: 170.0,
              path: user.profilePhotoUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _bestFoodPhoto(
                    width: 70.0,
                    height: 70.0,
                    path: 'assets/images/comida2.jpg',
                  ),
                  _bestFoodPhoto(
                    width: 70.0,
                    height: 70.0,
                    path: 'assets/images/comida3.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bio(name, description) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            user.name,
            textAlign: TextAlign.center,
            style: userNameStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DescriptionTextWidget(text: user.description),
          ),
        ],
      ),
    );
  }

  Widget _followsAndPostsInfo(user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: _quantityCol(user.recipes, "recipes"),
        ),
        Expanded(
          child: _quantityCol(user.followers, "followers"),
        ),
        Expanded(
          child: _quantityCol(user.following, "following"),
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.grid_on,
              color: (_displayPosts == 0)
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              size: 34.0,
            ),
            onTap: () => setState(() {
              _displayPosts = 0;
            }),
          ),
          GestureDetector(
            child: Icon(
              Icons.list,
              color: (_displayPosts == 1)
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              size: 34.0,
            ),
            onTap: () => setState(() {
              _displayPosts = 1;
            }),
          ),
        ],
      ),
    );
  }

  Widget _recipePhoto(size, url) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 40.0,
        width: size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 1.5,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(url),
            )),
      ),
    );
  }

  Widget _bestFoodPhoto({width, height, path}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(60.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(path),
          )),
    );
  }

  Widget _profilePhoto({width, height, path}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(200.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(path),
          )),
    );
  }

  Widget _quantityCol(int quantity, String type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$quantity",
          style: followsStyle,
        ),
        Text(type, style: followsStyle),
      ],
    );
  }
}
