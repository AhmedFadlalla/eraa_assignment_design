import 'package:eraa_soft/shared/constant.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons=[
     Icons.design_services,
      Icons.developer_mode,
      Icons.medical_services_rounded,
      Icons.sports_gymnastics,
      Icons.electrical_services_outlined,
      Icons.manage_accounts_rounded,
      Icons.cast_for_education_outlined,
      Icons.sim_card_alert_sharp,


    ];
    List<String> text=[
      'Designer',
      'Developer',
      'Doctor',
      'Gym Trainer',
      'Electrician',
      'Manager',
      'Teacher',
      'Sales Man',

    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: defaultColor
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    right: 25,
                    child: Row(
                      children: [
                        Container(
                            height: 40,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            child: const Icon(
                              Icons.drag_handle_outlined,
                              color: Colors.white,

                            )
                        ),
                        const Spacer(),
                        Container(
                            height: 40,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,

                            )
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 25,),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Find Jobs',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child:Container(

                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.54,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  children: List.generate(icons.length,
                          (index) =>buildJobItem(icons[index], text[index]) ),
                ),
              ) ,
            )
          ],
        ),
      ),
    );
  }
  Widget buildJobItem(IconData iconData,text)=>Column(
    children: [

      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2),

        ),
        child:Icon(iconData),
      ),
      const SizedBox(height: 25,),
       Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    ],
  );
}
