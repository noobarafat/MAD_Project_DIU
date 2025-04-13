import 'package:flutter/material.dart';
import 'event_detail_page.dart';

class FavoriteScreen extends StatelessWidget {
 
  final List<Map<String, String>> favoriteEvents;

  
  const FavoriteScreen({super.key, required this.favoriteEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Events"),
        backgroundColor: Colors.deepPurple,
      ),
      body: favoriteEvents.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteEvents.length,
              itemBuilder: (context, index) {
                final event = favoriteEvents[index];
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
                      leading: event['image'] != null && event['image']!.isNotEmpty
                          ? Image.asset(
                              event['image']!,
                              width: 70,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.event,
                              size: 48,
                              color: Colors.deepPurple,
                            ),
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
    );
  }
}