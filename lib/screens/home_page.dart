import 'package:flutter/material.dart';
import 'event_detail_page.dart'; 
import 'add_event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> allEvents = [
    {
      'title': 'AUST Job Fair',
      'description': 'Explore job opportunities at AUST.',
      'image': 'assets/images/AUST_JOB_FAIR.jpg',
      'date': '2025-04-10',
      'time': '10:00 AM',
      'category': 'Job Fair',
      'full_description': 'Join us for a unique opportunity to meet employers and explore job openings. The fair includes several companies offering positions across multiple sectors, making it a great event to kick-start your career. Come prepared with your resume and professional attire. It’s a great chance for students to network and find potential employment opportunities.'
    },
    {
      'title': 'AUST Undergraduate Research',
      'description': 'Showcasing undergraduate research projects.',
      'image': 'assets/images/AUST_Undergraduate_Research.jpg',
      'date': '2025-04-15',
      'time': '12:00 PM',
      'category': 'Research',
      'full_description': 'This event showcases a variety of undergraduate research projects. It provides an excellent platform for students to present their work and gain insights from peers and faculty. Whether you’re looking for inspiration or have a project to present, this event is a must-attend. Students will have the chance to discuss their research findings, and faculty members will provide feedback and suggestions.'
    },
    {
      'title': 'DIU CSE Study Tour',
      'description': 'Join us for an exciting study tour.',
      'image': 'assets/images/DIU_CSE_Study_Tour.jpg',
      'date': '2025-05-05',
      'time': '7:00 AM',
      'category': 'Tour',
      'full_description': 'Join us for an exciting study tour of various technological hubs and research centers. The study tour is designed to give students hands-on experience with the latest technology trends and innovations. We will visit various institutes and interact with professionals in the tech field, giving you invaluable knowledge and experiences for your future career.'
    },
    {
      'title': 'DIU Take Off Contest',
      'description': 'Compete in DIU\'s Take Off Contest.',
      'image': 'assets/images/DIU_Take_Off_Contest.jpg',
      'date': '2025-04-20',
      'time': '9:00 AM',
      'category': 'Contest',
      'full_description': 'Are you ready to showcase your skills? Join the DIU Take Off Contest, where you can compete against your peers in various competitions. Whether you are a coder, designer, or innovator, this contest offers an opportunity for all students to shine and win amazing prizes. It’s a fun and exciting way to test your skills and network with like-minded individuals.'
    },
    {
      'title': 'DIU UTA Program',
      'description': 'Unlock your technical abilities.',
      'image': 'assets/images/DIU_UTA.jpg',
      'date': '2025-04-25',
      'time': '2:00 PM',
      'category': 'Workshop',
      'full_description': 'The DIU UTA Program offers students a chance to enhance their technical skills through a series of interactive workshops. This program is designed to help students unlock their full potential and learn new, valuable skills. Experts from various fields will share their knowledge and provide practical advice that will be beneficial for your future career.'
    },
    {
      'title': 'UIU Programming Career',
      'description': 'Plan your career in programming.',
      'image': 'assets/images/UIU_Programming_carrier.jpg',
      'date': '2025-04-30',
      'time': '1:00 PM',
      'category': 'Career',
      'full_description': 'This event is designed for those who are interested in pursuing a career in programming. We will cover various programming languages, career paths, and opportunities in the tech industry. Industry experts will share their experiences and offer advice on how to navigate the competitive tech job market. Whether you are just starting out or looking to make a career switch, this event has something for everyone.'
    },
    {
      'title': 'UIU CCL UI/UX Design',
      'description': 'Learn UI/UX Design essentials.',
      'image': 'assets/images/UIU_CCL_UI_UX_Design.jpg',
      'date': '2025-05-01',
      'time': '11:00 AM',
      'category': 'Design',
      'full_description': 'Are you interested in UI/UX Design? This workshop is for you! Learn the basics of UI/UX design principles and how to create user-friendly interfaces. Experts in the field will guide you through the design process and share insights into the latest trends in the design world. Whether you are looking to start a career in design or want to expand your skills, this session will provide you with the tools and knowledge to succeed.'
    },
  ];

  List<Map<String, String>> displayedEvents = [];

  @override
  void initState() {
    super.initState();
    displayedEvents = allEvents;
  }

  void updateSearch(String query) {
    final results = allEvents.where((event) =>
        event['title']!.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      displayedEvents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Events"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: 'Search Event...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedEvents.length,
              itemBuilder: (context, index) {
                final event = displayedEvents[index];
                return GestureDetector(
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailPage(
                          title: event['title']!,
                          image: event['image']!,
                          description: event['description']!,
                          date: event['date']!,
                          time: event['time']!,
                          category: event['category']!,
                          fullDescription: event['full_description']!, 
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 4,
                    child: ListTile(
                      leading: Image.asset(event['image']!, width: 70, fit: BoxFit.cover),
                      title: Text(event['title']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event['description']!),
                          Text('Date: ${event['date']}'),
                          Text('Time: ${event['time']}'),
                          Text('Category: ${event['category']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventPage()),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder( // Adding a rounded shape
    borderRadius: BorderRadius.circular(16),
  ),
  elevation: 10,
        child: const Icon(Icons.add,
        
        color: Colors.white, 
      ),
      ),
    );
  }
}
