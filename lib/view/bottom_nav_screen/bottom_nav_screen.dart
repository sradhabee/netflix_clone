import 'package:flutter/material.dart';
import 'package:netflix_clone/dummy_db.dart';
import 'package:netflix_clone/utils/constants/color_constants.dart';
import 'package:netflix_clone/view/coming_soon_screen/coming_soon_screen.dart';
import 'package:netflix_clone/view/download_screen/download_screen.dart';
import 'package:netflix_clone/view/home_screen/home_screen.dart';
import 'package:netflix_clone/view/more_screen/more_screen.dart';
import 'package:netflix_clone/view/search_screen/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int selectedIndex=0;

  List<Widget> myScreens=[
    HomeScreen(),
    SearchScreen(
      movieList: DummyDb.movieListTile, 
    ),
    ComingSoonScreen(),
   DownloadScreen(),
    MoreScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      backgroundColor: ColorConstants.mainBlack,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.mainBlack,
        currentIndex: selectedIndex,
        selectedItemColor: ColorConstants.mainWhite,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Search"),
          BottomNavigationBarItem(icon: _ComingSoonIcon(),label: "Coming Soon"),
           BottomNavigationBarItem(icon: Icon(Icons.download_sharp,),label: "Downloads"),
            BottomNavigationBarItem(icon: Icon(Icons.menu,),label: "More"),
    
        
        
      ],
      onTap:(value){
        selectedIndex=value;
        setState(() {
          
        });
      },
    
  
      
      ),
    
    );
  }
}

  Widget _ComingSoonIcon() {
    return Stack(
     
      children: [
        Icon(Icons.video_collection_outlined),
        Positioned(
          right: -1,
          top: -2,
          child: CircleAvatar(
            radius: 7,
            backgroundColor: ColorConstants.primaryRed,
            child: Text(
              '4',
              style: TextStyle(color: ColorConstants.mainWhite, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
