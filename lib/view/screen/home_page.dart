import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_free_course/helper/data_category.dart';
import 'package:udemy_free_course/widgets/coursetile.dart';

import '../../helper/data_course.dart';
import '../../model/category_model.dart';
import '../../model/course_model.dart';
import '../../widgets/categorytile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<CategoryModel> categories = [];
  List<CourseModel> courses = [];

  bool _loading = true;

  @override
  void initState() {
    
    super.initState();
    categories = getCategory();
    getCourse();
  }

 getCourse() async {
    Course courseClass = Course();
    await courseClass.getCourse();
    courses = courseClass.course;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,

        backgroundColor: Color(0xffFFFFFF),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Color(0XFF747474),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Find your Free Courses",
                      style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff232323)),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/unnamed.png',),
                )
              ],
            ),
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: SpinKitWave(
                  color: Color(0xff99CAE1),
                  size: 30.0,
                ),
              ),
             
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Category",
                        style: GoogleFonts.notoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff232323)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,  index) {
                            return CategoryTile(
                              imageURL: categories[index].imageURL,
                              color: categories[index].color,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Courses",
                        style: GoogleFonts.notoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff232323)),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: courses.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,  index) {
                            return CourseTile(
                              imageURL: courses[index].image,
                              title: courses[index].heading,
                              courseURL: courses[index].courseLink,
                              successRate: '',

                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}