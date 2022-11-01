import 'package:flutter/material.dart';
import 'package:harry_potter_api/models/character.dart';

class CharactersListItem extends StatelessWidget {
  const CharactersListItem({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
            topLeft: Radius.circular(48),
            bottomLeft: Radius.circular(48)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                character.image!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: ((context, error, stackTrace) => ClipOval(
                      child: Image.network(
                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhb8fnYj2GwFR2aGZsIWyH7bu5GxxZ04-DO0X5Y-S4jXRgbygf0vshQsIGsq8zOd47Avy7fvj0rTEwhcy_JoxZFFj3i0DxcJcXWcmCnQpaZMKYlyyXWLDK4ncZJFRLtRU_swtexIKhwxsHrs0LhO7ZWKqIVOd1e5F34-DguDBhJ8F7aqfh0dqzN27al/s300/+artista_sem_foto_2.jpg',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: ((context, error, stackTrace) =>
                            Container()),
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name ?? 'Sem nome',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(character.house ?? 'Sem casa')
              ],
            )
          ],
        ),
      ),
    );
  }
}
