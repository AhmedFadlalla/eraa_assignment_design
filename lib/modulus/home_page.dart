import 'dart:developer';


import 'package:eraa_soft/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Image(image: AssetImage('assets/images/doc.jpg')),
            Positioned(
                left: 30,
                bottom: 40,
                child: Column(
                  children: [
                    Text(
                      'Welcome! \n  Ahmed',
                      style: GoogleFonts.anybody(
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Have a nice day',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(
                                Icons.upcoming_sharp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Urgent Care',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    )
                  ],
                )),
            Positioned(
                left: 18,
                right: 18,
                top: 30,
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a-/AFdZucqP7qxM--gpTkJrd0jhvPE1heMDZYQaniKKidLoXxw=s288-p-no'),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ecare Service',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child:Row(
                  children: [
                    Expanded(child: buildServiceItem('assets/icons/consultation.png', 'consultation')),
                    Expanded(child: buildServiceItem('assets/icons/medicine.png', 'medicine')),
                    Expanded(child: buildServiceItem('assets/icons/ambulance.png', 'ambulance'))
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Row(
                children: const[
                  Text(
                    'My Appointment',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),

                ],
              ),
              const SizedBox(height: 45,),
              Row(

                children: [
                  Container(
                    width: 10,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),

                  ),
                  const SizedBox(width: 20,),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Appointment date',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        child: Row(
                          children: const[
                            Icon(Icons.watch_later_outlined),
                            SizedBox(width: 5,),
                            Text(
                              'Wed Jun 20 - 8:00  8:30 AM',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),

                      Row(
                        children:  [
                          const CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/a-/AFdZucqP7qxM--gpTkJrd0jhvPE1heMDZYQaniKKidLoXxw=s288-p-no'),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [
                              Text(
                                'Dr.Ahmed Mohamed Fadlallah',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                'dentist',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                ],
              ),

            ],
          ),
        )
      ],
    );
  }
  Widget buildServiceItem(String icon,String text)=>Column(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(icon),
        radius: 35,
        backgroundColor: Colors.white,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text,
        style:const  TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15
        ),
      )
    ],
  );
}
