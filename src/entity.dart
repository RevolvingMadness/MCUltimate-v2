import 'dart:math';

import 'item.dart';

enum Entity {
  ALLAY,
  AREA_EFFECT_CLOUD,
  ARMOR_STAND,
  ARROW,
  AXOLOTL,
  BAT,
  BEE,
  BLAZE,
  BOAT,
  CAT,
  CAVE_SPIDER,
  CHEST_BOAT,
  CHEST_MINECART,
  CHICKEN,
  COD,
  COMMAND_BLOCK_MINECART,
  COW,
  CREEPER,
  DOLPHIN,
  DONKEY,
  DRAGON_FIREBALL,
  DROWNED,
  EGG,
  ELDER_GUARDIAN,
  END_CRYSTAL,
  ENDER_DRAGON,
  ENDER_PEARL,
  ENDERMAN,
  ENDERMITE,
  EVOKER,
  EVOKER_FANGS,
  EXPERIENCE_BOTTLE,
  EXPERIENCE_ORB,
  EYE_OF_ENDER,
  FALLING_BLOCK,
  FIREBALL,
  FIREWORK_ROCKET,
  FISHING_BOBBER,
  FOX,
  FROG,
  FURNACE_MINECART,
  GHAST,
  GIANT,
  GLOW_ITEM_FRAME,
  GLOW_SQUID,
  GOAT,
  GUARDIAN,
  HOGLIN,
  HOPPER_MINECART,
  HORSE,
  HUSK,
  ILLUSIONER,
  IRON_GOLEM,
  ITEM,
  ITEM_FRAME,
  LEASH_KNOT,
  LIGHTNING_BOLT,
  LLAMA,
  LLAMA_SPIT,
  MAGMA_CUBE,
  MARKER,
  MINECART,
  MOOSHROOM,
  MULE,
  OCELOT,
  PAINTING,
  PANDA,
  PARROT,
  PHANTOM,
  PIG,
  PIGLIN,
  PIGLIN_BRUTE,
  PILLAGER,
  PLAYER,
  POLAR_BEAR,
  POTION,
  PUFFERFISH,
  RABBIT,
  RAVAGER,
  SALMON,
  SHEEP,
  SHULKER,
  SHULKER_BULLET,
  SILVERFISH,
  SKELETON,
  SKELETON_HORSE,
  SLIME,
  SMALL_FIREBALL,
  SNOW_GOLEM,
  SNOWBALL,
  SPAWNER_MINECART,
  SPECTRAL_ARROW,
  SPIDER,
  SQUID,
  STRAY,
  STRIDER,
  TADPOLE,
  TNT,
  TNT_MINECART,
  TRADER_LLAMA,
  TRIDENT,
  TROPICAL_FISH,
  TURTLE,
  VEX,
  VILLAGER,
  VINDICATOR,
  WANDERING_TRADER,
  WARDEN,
  WITCH,
  WITHER,
  WITHER_SKELETON,
  WITHER_SKULL,
  WOLF,
  ZOGLIN,
  ZOMBIE,
  ZOMBIE_HORSE,
  ZOMBIE_VILLAGER,
  ZOMBIFIED_PIGLIN,
  EVERYONE,
  SELF,
  RANDOM,
  NEAREST;

  static String toText({required Entity entity}) {
    switch (entity) {
      case Entity.SELF:
        return "@s";
      case Entity.RANDOM:
        return "@r";
      case Entity.NEAREST:
        return "@p";
      case Entity.EVERYONE:
        return "@a";
      default:
        return "@e[type=" + entity.name.toLowerCase() + "]";
    }
  }

  static String Self() => "entity @s";
  static String Everyone() => "entity @a";
  static String Random() => "entity @r";
  static String Nearest() => "entity @p";

  static String holding_item({required Entity entity, required Item item}) {
    // entity @s[nbt={SelectedItem:{id:"minecraft:feather"}}]
    String result = "entity " +
        Entity.toText(entity: entity) +
        "[nbt={SelectedItem:{id:\"minecraft:" +
        item.item! +
        "\"";
    if (item.nbt != null) result += ", tag:" + item.nbt!.getNBTTag();
    if (item.count != null) result += ", Count:" + item.count.toString() + "b";
    result += "}}]";
    return result;
  }
}
