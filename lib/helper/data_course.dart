import 'package:udemy_free_course/model/course_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Course{
  List<CourseModel> course = [];

  Future<void> getCourse() async {

    var url = 'https://sumanjay.vercel.app/udemy';
    var response = await http.get(Uri.parse(url),headers: {'Access-Control-Allow-Origin': '*'});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData.forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['title'],
          image: element['image'],
          courseLink: element['link'], successRate: '',
        );
        course.add(courseModel);
      });
    }
    else{
      print(response.statusCode);
    }
  }
}

