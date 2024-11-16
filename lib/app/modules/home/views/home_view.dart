import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokeman/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../poke_mon_response_model.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<String> _allCardNames = ["jks", "kumar", "sahoo", "jatin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(
            id: "appbar",
            builder: (controller) {
              return Container(
                child: !controller.isSearching
                    ? const Text('Pokémon Cards')
                    : Row(
                        children: [
                          Expanded(
                            child: Autocomplete<Data>(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<Data>.empty();
                                }
                                return controller.pokemonDataList!
                                    .where((Data cardName) {
                                  return cardName.set!.name
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (Data selection) {
                                FocusScope.of(context).unfocus();
                                if (selection.set?.name?.isNotEmpty ?? false) {
                                  try {
                                    List<String> list =
                                        (selection.set?.name ?? "").split(" ");

                                    if (list.length == 1) {
                                      list = (selection.set?.name ?? "")
                                          .split("-");
                                      controller.callSearchApi(
                                          text: list[0] ?? "");
                                    } else {
                                      controller.callSearchApi(
                                          text: list[0] ?? "");
                                    }
                                  } catch (e) {
                                    controller.callSearchApi(
                                        text: selection.set?.name ?? "");
                                  }
                                } else {
                                  controller.callSearchApi(
                                      text: selection.set?.name ?? "");
                                }
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController
                                      fieldTextEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: fieldTextEditingController,
                                    focusNode: focusNode,
                                    decoration: InputDecoration(
                                        hintText: 'Search Pokémon',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: BorderSide(
                                            color: Colors
                                                .grey.shade400, // Border color
                                            width: 1.5,
                                          ),
                                        ),
                                        suffixIcon: controller.isSearching
                                            ? IconButton(
                                                icon: const Icon(Icons.clear),
                                                onPressed: () {
                                                  fieldTextEditingController
                                                      .clear();
                                                  controller.isSearching =
                                                      !controller.isSearching;
                                                  if (!controller.isSearching) {
                                                    controller.searchController
                                                        .clear();
                                                    controller.pokemonDataList =
                                                        [
                                                      ...?controller
                                                          .masterPokemonDataList
                                                    ];
                                                    controller.update(['grid']);
                                                  }
                                                  controller.update(['appbar']);
                                                },
                                              )
                                            : const Icon(Icons.search),
                                        prefixIcon: const Icon(Icons.search)),
                                    onSubmitted: (value) {
                                      controller.isSearching = false;
                                      controller.callSearchApi(text: value);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              );
            }),
        actions: [
          GetBuilder<HomeController>(
              id: "appbar",
              builder: (controller) {
                return controller.isSearching
                    ? Container()
                    : IconButton(
                        icon:
                            Icon(controller.isSearching ? null : Icons.search),
                        onPressed: () {
                          controller.isSearching = !controller.isSearching;
                          if (!controller.isSearching) {
                            controller.searchController.clear();
                            controller.pokemonDataList = [
                              ...?controller.masterPokemonDataList
                            ];
                            controller.update(['grid']);
                          }
                          controller.update(['appbar']);
                        },
                      );
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HomeController>(
            id: "grid",
            builder: (controller) {
              return (controller.pokemonDataList?.isNotEmpty ?? false)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            0.55, // Adjust to make cards look better
                      ),
                      controller: controller.scrollController,
                      itemCount: controller.pokemonDataList?.length ?? 0,
                      itemBuilder: (context, index) {
                        Data? card = controller.pokemonDataList?[index];

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.POKEMON_DETAILS,arguments: card?.toJson());
                          },
                          child: Hero(
                            tag: card?.id ?? "default",
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              margin: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl: card?.images?.small ?? "",
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator()),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/pokemon.png',
                                        // Default image if error occurs
                                        height: 80,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Pokémon Name and HP
                                  SizedBox(
                                    height: 20,
                                    child: Text(
                                      card?.set?.name ?? "Unknown",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    'HP: ${card?.hp ?? "N/A"}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  // Pokémon Attacks
                                  if (card?.attacks?.isNotEmpty ?? false)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: SizedBox(
                                        height: 40,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            Attacks? attack =
                                                card?.attacks?[index];
                                            return Row(
                                              children: [
                                                const Icon(Icons.bolt,
                                                    size: 16,
                                                    color: Colors.yellow),
                                                const SizedBox(width: 4),
                                                Text(
                                                  attack?.name ?? "Unknown",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            );
                                          },
                                          itemCount: card?.attacks?.length ?? 0,
                                        ),
                                      ),
                                    ),
                                  const Divider(thickness: 1, height: 10),

                                  // Weakness Information
                                  if (card?.weaknesses?.isNotEmpty ?? false)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'Weakness: ${card?.weaknesses?.first.type ?? "None"}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.redAccent),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  const Spacer(),

                                  // Pokémon Set and Rarity
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                            imageUrl:
                                                card?.set?.imagesS?.symbol ??
                                                    "",
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                const Center(
                                                  child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child:
                                                          CircularProgressIndicator()),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                                      'assets/pokemon.png',
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    )),
                                        const SizedBox(width: 4),
                                        SizedBox(
                                          height: 20,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                card?.rarity ?? "XXXXXX",
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
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
                      },
                    )
                  : const Center(
                      child: Text("Data not found!!"),
                    );
            }),
      ),
    );
  }
}
