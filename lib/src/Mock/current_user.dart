import '../models/user.dart';

final User currentUser = User(
  uid: "3245sf123",
  username: "@mike.rak",
  name: "Mike Thompson",
  description:
      "Football player ⚽️\nVegan 🌱🐻 🐼 \nTraveler ✈️ \nSoftware engineering 💻\n",
  followers: 427,
  following: 523,
  profilePhotoUrl: "assets/images/profilephoto.jpeg",
  recipes: 4,
);

final List<String> userUrlPosts = [
  'assets/images/comida.jpeg',
  'assets/images/comida1.jpg',
  'assets/images/comida2.jpg',
  'assets/images/comida3.jpg',
];
