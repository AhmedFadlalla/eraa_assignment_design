import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/constant.dart';

class FileScreen extends StatelessWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var searchController=TextEditingController();
    List<Color> fileColor=[
      defaultColor,
      Colors.orange,
      Colors.blue,
      Colors.pink
    ];
    List<String> text=[
      'Photos',
      'Songs',
      'Videos',
      'Documents'
    ];
    List<int> numberOfFiles=[
      2451,
      245,
      54,
      841

    ];
    List<String> numberOfHours=[
      '24 hours ago',
      '12 hours ago',
      '2 days ago',
      '1 days ago'

    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: height*0.04,),
              Row(
                children: [

                  Container(
                      height: 40,
                      width: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey
                      ),
                      child: const Icon(
                        Icons.drag_handle_outlined,
                        color: Colors.white,

                      )
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/a-/AFdZucqP7qxM--gpTkJrd0jhvPE1heMDZYQaniKKidLoXxw=s288-p-no'),
                  ),
                ],
              ),
              SizedBox(height: height*0.04,),
              Text(
                'Hello! \nAhmed Fadlallah',
                style: GoogleFonts.anybody(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Let\'s manage your own storage',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              defaultTextField(
                  controller: searchController,
                  inputText: TextInputType.text,
                  validator: (value){},
                  suffixIcon: Icons.search,
                  label: 'Search'),
              const SizedBox(
                height: 20,
              ),
              Container(

                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.54,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (context,index)=>buildFileItem(fileColor[index], text[index],numberOfFiles[index],numberOfHours[index])
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFileItem(Color color,String text,int number,String lastUpdate)=> Container(
    height: 180,
    width: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),

    ),
    child: Card(

      color: color,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                SizedBox(
                    width: 45,
                    height: 45,
                    child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3767/3767084.png'))),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  size: 35,
                ),

              ],
            ),
            const SizedBox(height: 10,),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            const SizedBox(height: 7,),
            Text(
              '$number',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18
              ),
            ),
            const Spacer(),
             Text(
              'Last update $lastUpdate',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
