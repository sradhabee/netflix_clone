import 'package:flutter/material.dart';

import 'package:netflix_clone/utils/constants/color_constants.dart';

class MoviesCardBuilderWidget extends StatelessWidget {
  const MoviesCardBuilderWidget({super.key,  this.isCircle=false,  this.customHeight=161,  this.customWidth=103,required this.titleText, required this.posterImages, this.haveInfoCard=false, });
  final bool isCircle;
  final double customHeight;
  final double customWidth;
  final String titleText;
  final List<String>posterImages;
  final bool haveInfoCard;
   

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(titleText,style: TextStyle(color: ColorConstants.mainWhite,fontSize: 20.92,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 22),
        SizedBox(
          height: isCircle?customWidth:customHeight,
          child: ListView.separated(itemBuilder: (context, index) => Container(
           
            decoration: BoxDecoration(
              shape: isCircle ? BoxShape.circle:BoxShape.rectangle,
               color: ColorConstants.mainBlack,
               image: DecorationImage(image: NetworkImage(posterImages[index]),fit: BoxFit.cover)
            ),
            height: customHeight,
            width: customWidth,

             child: Visibility(
              visible: haveInfoCard,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 3,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    color: ColorConstants.mainBlack,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.info_outline,color: ColorConstants.mainWhite,),
                        Icon(Icons.more_vert,color: ColorConstants.mainWhite,),
                      ],
                    ),
                  )
                  
                ],
               
                           ),
             ),
           
          ), 
          separatorBuilder: (context, index) => SizedBox(width: 7,), itemCount: posterImages.length,
          scrollDirection: Axis.horizontal,
          ),
          ),
          SizedBox(height: 22,),
      ],

    );
  }
}