
import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // TODO 1. Deklarasikan variabel
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO 5. Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = true;
      fullName = 'Budi Santoso';
      userName = 'budi123';
      favoriteCandiCount = 5;
    });
  }

  // TODO 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = false;
      fullName = '';
      userName = '';
      favoriteCandiCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [

                // TODO 2. ProfileHeader
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),

                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // TODO 3. ProfileDetail
                const SizedBox(height: 20),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),

                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Icon edit ditekan...');
                  },
                  iconColor: Colors.blue,
                ),

                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0
                      ? '$favoriteCandiCount'
                      : '',
                  iconColor: Colors.red,
                ),

                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),

                // TODO 4. ProfileAction
                isSignedIn
                    ? TextButton(
                        onPressed: signOut,
                        child: const Text('Sign Out'),
                      )
                    : TextButton(
                        onPressed: signIn,
                        child: const Text('Sign In'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
