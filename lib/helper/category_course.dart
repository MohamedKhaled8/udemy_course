import '../model/course_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CategoryCourse {
  List<CourseModel> course = [];

  Future<void> getCourse(String category) async {

    var url = 'https://udemycoupon.herokuapp.com';
    var response = await http.get(Uri.parse(url),headers: {'Access-Control-Allow-Origin': '*'});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData[0]['$category'].forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['heading'],
          image: element['image'],
          courseLink: element['courselink'],
          successRate: element['successrate'],
        );
        print(response.statusCode);

        course.add(courseModel);
      });
    }
    else{
      print(response.statusCode);
    }
  }
}