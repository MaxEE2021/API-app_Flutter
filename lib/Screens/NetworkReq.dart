import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_blog_using_api/widgets/MenuWidgets.dart';
import 'package:http/http.dart' as http;


class BlogEntryFromReq extends StatefulWidget {
  BlogEntryFromReq({Key? key}) : super(key: key);

  @override
  _BlogEntryFromReqState createState() => _BlogEntryFromReqState();
}



class _BlogEntryFromReqState extends State<BlogEntryFromReq> {

var URL = "https://codesundar.com/wp-json/wp/v2/posts";
var _content =[];




getEntriesFromNetwork() async {
  try{
    http.get(Uri.parse(URL)).then((response){
      print("ocurrio succes");
      print(response.body);
      var resp = json.decode(response.body);
      setState(() {
        _content = resp; ///here I save the content
        print(_content);
      });
    }).catchError((e){
      print("Ocurrio un error");
      print(e);
    });
  }
  catch(e){
    print(e);
  }
}










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        actions: [
          IconButton(
            onPressed: (){getEntriesFromNetwork();}, 
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: _content.length == 0 ? 
        Text("please make request")
        :ListView.builder(
          itemCount: _content.length,
          itemBuilder: (BuildContext context,int index) {
            // return ListTile(
            //   title: Text( "${_content[index]["yoast_head_json"]['title']}"),
            // );
            return Container(
              child: MyDesingWidget(
                JsonImg: "${_content[index]["yoast_head_json"]["og_image"][0]["url"]}",
                JsonTitle: "${_content[index]["yoast_head_json"]["og_title"]}",
                JsonDesc: "${_content[index]["yoast_head_json"]["og_description"]}",
                JsonModified: "${_content[index]["modified"]}",
              ),




              // child: Image.network("${_content[index]["yoast_head_json"]["og_image"][0]["url"]}"),
            );
          },
        ),
      ),
    );
  }
}
