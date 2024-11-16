import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/app_utility.dart';
import '../controllers/pokemon_details_controller.dart';

class PokemonDetailsView extends GetView<PokemonDetailsController> {
  const PokemonDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonDetailsController>(
        id: "all",
        builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.pokeManData?.set?.name ?? 'Card Details'),
        ),
        body: (controller.pokeManData != null)
            ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: controller.pokeManData?.id ?? "default",
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: controller.pokeManData?.images?.large ?? "",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(
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
                ),
                const SizedBox(height: 16),
                Text(
                  'Name: ${controller.pokeManData?.name ?? 'N/A'}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Artist: ${controller.pokeManData?.artist ?? 'N/A'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rarity: ${controller.pokeManData?.rarity ?? 'N/A'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flavor Text: ${controller.pokeManData?.flavorText ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Attacks:',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (controller.pokeManData?.attacks != null &&
                    controller.pokeManData!.attacks!.isNotEmpty)
                  ...controller.pokeManData!.attacks!.map(
                        (attack) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${attack.name}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Cost: ${attack.cost?.join(', ') ?? 'N/A'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Damage: ${attack.damage ?? 'N/A'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Effect: ${attack.text ?? 'N/A'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                const Text(
                  'Weaknesses:',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (controller.pokeManData?.weaknesses != null &&
                    controller.pokeManData!.weaknesses!.isNotEmpty)
                  ...controller.pokeManData!.weaknesses!.map(
                        (weakness) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${weakness.type}: ${weakness.value}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                Text(
                  'Set: ${controller.pokeManData?.set?.name ?? 'N/A'}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Series: ${controller.pokeManData?.set?.series ?? 'N/A'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Release Date: ${controller.pokeManData?.set?.releaseDate ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                if (controller.pokeManData?.set?.imagesS?.symbol != null)
                  Image.network(
                    controller.pokeManData?.set?.imagesS?.symbol ?? "",
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                const SizedBox(height: 16),

                const Text(
                  'TCGPlayer Price Info:',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Holofoil: \$${controller.pokeManData?.tcgplayer?.prices?.holofoil?.market ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Reverse Holofoil: \$${controller.pokeManData?.tcgplayer?.prices?.reverseHolofoil?.market ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        )
            : const Center(
          child: Text("Loading......"),
        ),
      );
    });
  }
}
