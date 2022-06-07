import 'package:flutter/material.dart';
import 'package:twitter_projesi/model/post.dart';

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List<Post> posts = [
    Post(
      "9GAG Memeland",
      "The best food in the world is served with cheese",
      "assets/images/aykut.jpg",
      "assets/images/aykut.jpg",
      24,
      134,
      655,
    ),
    Post(
      "Disney+ Türkiye",
      "Hayal ettiğinden çok daha fazlası! 14 Haziran'da yayında. #DisneyPlus",
      "assets/images/Merttt.jpg",
      "assets/images/Merttt.jpg",
      45,
      60,
      1234,
    ),
    Post(
      "Buzz Spor",
      "Aklını aldı!",
      "assets/images/serhat.jpg",
      "assets/images/serhat.jpg",
      0,
      0,
      1,
    ),
    Post(
      "nerde o eski tivitler",
      "",
      "assets/images/kobra.jpg",
      "assets/images/kobra.jpg",
      1,
      0,
      18,
    ),
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _buildKobraMurat(),
      centerTitle: true,
      leading: _buildProfileImage(),
      actions: [
        _buildStarButton(),
      ],
      backgroundColor: Colors.white,
    );
  }

  Widget _buildStarButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.star_border,
        color: Colors.black,
      ),
    );
  }

  Widget _buildProfileImage() {
    return IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/aykut.jpg",
        ),
      ),
    );
  }

  Widget _buildKobraMurat() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: CircleBorder(),
      child: Image.asset(
        "assets/images/kobra.jpg",
        height: 36,
      ),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _buildListItem,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Post post = posts[index];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(post.profileImage),
              ),
              SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    post.subtitle.isNotEmpty
                        ? Text(
                            post.subtitle,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 6,
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        post.postImage,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIconButtonRow(
                            Icons.comment_bank_outlined, post.commentCount),
                        _buildIconButtonRow(Icons.refresh, post.retweetCount),
                        _buildIconButtonRow(Icons.heart_broken, post.likeCount),
                        _buildIconButtonRow(Icons.share, 0),
                        SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 2),
      ],
    );
  }

  Widget _buildIconButtonRow(IconData iconData, int count) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData),
        ),
        count != 0 ? Text(count.toString()) : SizedBox(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedItemIndex,
      onTap: (int index){
        setState((){
          _selectedItemIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outline),
          label: '',
        ),
      ],
    );
  }
}
