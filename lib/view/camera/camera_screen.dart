import 'package:fitnessapp/common_widgets/round_button.dart';
import 'package:fitnessapp/common_widgets/round_gradient_button.dart';
import 'package:fitnessapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  var image;
  Future getImage(bool isCamera ) async{
    var image;
  }

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List photoArr = [
    {
      "time": " May",
      "photo": [
        "assets/images/pic1.jpeg",
        "assets/images/pic2.jpeg",
        "assets/images/pic3.jpeg",
        "assets/images/pic4.jpeg",
      ]
    },
    {
      "time": " June",
      "photo": [
        "assets/images/pic5.jpeg",
        "assets/images/pic6.jpeg",
        "assets/images/pic7.jpeg",
        "assets/images/pic8.jpeg",
      ]
    },
    {
      "time": "5 July",
      "photo": [
        "assets/images/pic5.jpeg",
        "assets/images/pic6.jpeg",
        "assets/images/pic7.jpeg",
        "assets/images/pic8.jpeg",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "Progress Photos",
          style: TextStyle(
              color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.lightGrayColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/icons/more_icon.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(20),
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.primaryColor2.withOpacity(0.4),
                          AppColors.primaryColor1.withOpacity(0.4)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Track Your Progress Each\nMonth With Photo",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 110,
                                height: 35,
                                child: RoundButton(
                                    title: "Learn More",
                                    onPressed: () {}),
                              )
                            ]),
                        Image.asset(
                          "assets/images/progress_each_photo.png",
                          width: media.width * 0.35,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Compare my Photo",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 100,
                        height: 25,
                        child: RoundButton(
                          title: "Compare",
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //     const ComparisonView(),
                            //   ),
                            // );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "See more",
                            style: TextStyle(color: AppColors.grayColor, fontSize: 12),
                          ))
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: photoArr.length,
                    itemBuilder: ((context, index) {
                      var pObj = photoArr[index] as Map? ?? {};
                      var imaArr = pObj["photo"] as List? ?? [];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pObj["time"].toString(),
                              style:
                              TextStyle(color: AppColors.grayColor, fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: imaArr.length,
                              itemBuilder: ((context, indexRow) {
                                return Container(
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 4),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrayColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imaArr[indexRow] as String? ?? "",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }))
              ],
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
          customBorder: CircleBorder(),
          focusColor: Colors.cyanAccent,

          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SleepAddAlarmView(
            //       date: _selectedDateAppBBar,
            //     ),
            //   ),
            // );
          },
          child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_enhance))
      ),
    );
  }
}

