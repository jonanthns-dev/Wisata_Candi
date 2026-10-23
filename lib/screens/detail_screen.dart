
import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        candi.imageAsset,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100]
                            ?.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            candi.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text(
                            'Lokasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(': ${candi.location}'),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text(
                            'Dibangun',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(': ${candi.built}'),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.house,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text(
                            'Tipe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(': ${candi.type}'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Divider(color: Colors.deepPurple.shade100),
                    const SizedBox(height: 16),

                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      candi.description,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.deepPurple.shade100),
                    const SizedBox(height: 10),

                    const Text(
                      'Galeri',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: candi.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      backgroundColor:
                                          Colors.transparent,
                                      insetPadding:
                                          const EdgeInsets.all(16),
                                      child: Stack(
                                        alignment:
                                            Alignment.topRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  candi.imageUrls[index],
                                              fit: BoxFit.contain,
                                              placeholder:
                                                  (context, url) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorWidget:
                                                  (context, url, error) {
                                                return const Icon(
                                                  Icons.error,
                                                  color: Colors.white,
                                                  size: 40,
                                                );
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.deepPurple.shade100,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: candi.imageUrls[index],
                                    width: 120,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) {
                                      return Container(
                                        width: 120,
                                        height: 100,
                                        color:
                                            Colors.deepPurple.shade50,
                                      );
                                    },
                                    errorWidget: (
                                      context,
                                      url,
                                      error,
                                    ) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Tap untuk memperbesar',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
