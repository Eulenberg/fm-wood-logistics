local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local wood_logistics_sounds = require("prototypes.entity.sounds")
local wood_logistics_simulations = require("prototypes.factoriopedia-simulations")

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  wood_belt_animation_set = {
    animation_set = {
      filename = "__wood-logistics__/graphics/entity/wood-transport-belt/wood-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      frame_count = 16,
      direction_count = 20
    }
  }

  data:extend({
    {
      type = "transport-belt",
      name = "wood-transport-belt",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-transport-belt"},
      max_health = 100,
      resistances = {{type="fire", percent = -90}},
      corpse = "wood-transport-belt-remnants",
      dying_explosion = "wood-transport-belt-explosion",
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = {
        sound = {
          filename = "__base__/sound/transport-belt.ogg",
          volume = 0.17
        },
        persistent = true
      },
      animation_speed_coefficient = 32,
      belt_animation_set = wood_belt_animation_set,
      fast_replaceable_group = "transport-belt",
      related_underground_belt = "wood-underground-belt",
      next_upgrade = "transport-belt",
      speed = 0.015625,
      connector_frame_sprites = transport_belt_connector_frame_sprites,
      circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
      circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
      circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
    },
    {
      type = "underground-belt",
      name = "wood-underground-belt",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-underground-belt"},
      max_health = 100,
      corpse = "wood-underground-belt-remnants",
      dying_explosion = "wood-underground-belt-explosion",
      max_distance = 4,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = {
        sound = {
          filename = "__base__/sound/underground-belt.ogg",
          volume = 0.2
        },
        max_sounds_per_type = 2,
        audible_distance_modifier = 0.5,
        persistent = true,
        use_doppler_shift = false
      },
      underground_sprite = {
        filename = "__core__/graphics/arrows/underground-lines.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      underground_remove_belts_sprite = {
        filename = "__core__/graphics/arrows/underground-lines-remove.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      resistances = {{type="fire", percent = -90}, {type = "impact", percent = 30}},
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      belt_animation_set = wood_belt_animation_set,
      fast_replaceable_group = "transport-belt",
      next_upgrade = "underground-belt",
      speed = 0.015625,
      structure = {
        direction_in = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
          }
        },
        direction_out = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        },
        direction_in_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            scale = 0.5
          }
        },
        direction_out_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y= 192*2,
            scale = 0.5
          }
        },
        back_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        },
        front_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      }
    },
    {
      type = "splitter",
      name = "wood-splitter",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-splitter"},
      max_health = 120,
      resistances = {{type="fire", percent = -90}},
      corpse = "wood-splitter-remnants",
      dying_explosion = "wood-splitter-explosion",
      collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
      selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      structure_animation_speed_coefficient = 0.7,
      structure_animation_movement_cooldown = 10,
      fast_replaceable_group = "transport-belt",
      next_upgrade = "splitter",
      speed = 0.015625,
      belt_animation_set = wood_belt_animation_set,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = sounds.splitter,
      structure = {
        north = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        },
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 84,
          shift = util.by_pixel(4, 13),
          scale = 0.5
        },
        south = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        },
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 86,
          shift = util.by_pixel(6, 12),
          scale = 0.5
        }
      },
      structure_patch = {
        north = util.empty_sprite(),
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-east-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 104,
          shift = util.by_pixel(4, -20),
          scale = 0.5
        },
        south = util.empty_sprite(),
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-west-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 96,
          shift = util.by_pixel(6, -18),
          scale = 0.5
        }
      }
    },
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "assembling-machine",
      name = "lumber-mill",
      icon = "__wood-logistics__/graphics/icons/lumber-mill.png",
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time=0.2, result="lumber-mill"},
      fast_replaceable_group = "lumber-mill",
      max_health = 350,
      corpse = "lumber-mill-remnants",
      dying_explosion = "lumber-mill-explosion",
      circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
      circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
        {variation=15, main_offset=util.by_pixel(56, 52), shadow_offset=util.by_pixel(70, 85), show_shadow=false},
        {variation=15, main_offset=util.by_pixel(56, 52), shadow_offset=util.by_pixel(70, 85), show_shadow=false},
        {variation=15, main_offset=util.by_pixel(56, 52), shadow_offset=util.by_pixel(70, 85), show_shadow=false},
        {variation=15, main_offset=util.by_pixel(56, 52), shadow_offset=util.by_pixel(70, 85), show_shadow=false},
      }),
      collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
      selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
      heating_energy = "100kW",
      damaged_trigger_effect = hit_effects.entity(),
      effect_receiver = {base_effect={productivity=0.5}},
      module_slots = 6,
      icon_draw_specification = {scale=2},
      icons_positioning = {
        {inventory_index=defines.inventory.assembling_machine_modules, shift={0, 1.25}}
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
      crafting_categories = {"carpentry", "crafting-or-carpentry"},
      crafting_speed = 2,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {pollution=3}
      },
      energy_usage = "600kW",
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      impact_category = "wood",
      perceived_performance = {minimum=0.25, performance_to_activity_rate=0.25, maximum=8},
      graphics_set = {
        animation = {
          layers = {
            util.sprite_load("__wood-logistics__/graphics/entity/lumber-mill/lumber-mill-animation", {
              frame_count = 80,
              animation_speed = 0.32,
              scale = 0.5
            }),
            util.sprite_load("__wood-logistics__/graphics/entity/lumber-mill/lumber-mill-shadow", {
              draw_as_shadow = true,
              repeat_count = 80,
              scale = 0.5
            }),
          }
        },
        working_visualizations = {
          {
            effect = "flicker",
            fadeout = true,
            animation = util.sprite_load("__wood-logistics__/graphics/entity/lumber-mill/lumber-mill-emission", {
              draw_as_glow = true,
              blend_mode = "additive",
              frame_count = 80,
              animation_speed = 0.32,
              scale = 0.5
            })
          }
        }
      },
      working_sound = {
        sound = {
          filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5
        },
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        audible_distance_modifier = 0.6,
        max_sounds_per_type = 2
      }
    }
  })
end

-------------------------------------------------------------------------- Trains

if settings.startup["wood-logistics-cargo-wagon"].value then
  data:extend({
    {
      type = "cargo-wagon",
      name = "wood-cargo-wagon",
      icon = "__wood-logistics__/graphics/icons/wood-cargo-wagon.png",
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
      inventory_size = 20,
      minable = {mining_time = 0.5, result = "wood-cargo-wagon"},
      mined_sound = sounds.deconstruct_large(0.8),
      max_health = 300,
      deliver_category = "vehicle",
      corpse = "wood-cargo-wagon-remnants",
      dying_explosion = "wood-cargo-wagon-explosion",
      factoriopedia_simulation = wood_logistics_simulations.factoriopedia_wood_cargo_wagon,
      collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
      selection_box = {{-1, -2.703125}, {1, 3.296875}},
      damaged_trigger_effect = hit_effects.entity(),
      vertical_selection_shift = -0.796875,
      weight = 1000,
      max_speed = 1.5,
      braking_force = 3,
      friction_force = 0.50,
      air_resistance = 0.01,
      connection_distance = 3,
      joint_distance = 4,
      energy_per_hit_point = 5,
      resistances = {{type="fire", percent=-90}},
      back_light = data.raw["cargo-wagon"]["cargo-wagon"].back_light,
      stand_by_light = data.raw["cargo-wagon"]["cargo-wagon"].stand_by_light,
      color = {r=0.43, g=0.23, b=0, a=1},
      pictures = {
        rotated = {
          layers = {
            util.sprite_load("__wood-logistics__/graphics/entity/wood-cargo-wagon/wood-cargo-wagon", {
                dice = 4,
                priority = "very-low",
                allow_low_quality_rotation = true,
                back_equals_front = true,
                direction_count = 128,
                scale = 0.5,
                usage = "train"
              }
            ),
            util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-mask", {
                dice = 4,
                priority = "very-low",
                allow_low_quality_rotation = true,
                back_equals_front = true,
                flags = { "mask" },
                apply_runtime_tint = true,
                tint_as_overlay = true,
                direction_count = 128,
                scale = 0.5,
                usage = "train"
              }
            ),
            util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow", {
                dice = 4,
                priority = "very-low",
                allow_low_quality_rotation = true,
                back_equals_front = true,
                draw_as_shadow = true,
                direction_count = 128,
                scale = 0.5,
                usage = "train"
              }
            )
          }
        }
      },
      horizontal_doors = {
        layers = {
          util.sprite_load("__wood-logistics__/graphics/entity/wood-cargo-wagon/wood-cargo-wagon-door-horizontal", {
              frame_count = 8,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-mask", {
              apply_runtime_tint = true,
              tint_as_overlay = true,
              flags = { "mask" },
              frame_count = 8,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      },
      vertical_doors = {
        layers = {
          util.sprite_load("__wood-logistics__/graphics/entity/wood-cargo-wagon/wood-cargo-wagon-door-vertical", {
              frame_count = 8,
              scale = 0.5,
              usage = "train"
            }
          ),
          util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-mask",
            {
              apply_runtime_tint = true,
              tint_as_overlay = true,
              flags = { "mask" },
              frame_count = 8,
              scale = 0.5,
              usage = "train"
            }
          )
        }
      },
      minimap_representation = {
        filename = "__base__/graphics/entity/cargo-wagon/minimap-representation/cargo-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
      },
      selected_minimap_representation = {
        filename = "__base__/graphics/entity/cargo-wagon/minimap-representation/cargo-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
      },
      wheels = data.raw["cargo-wagon"]["cargo-wagon"].wheels,
      drive_over_tie_trigger = data.raw["cargo-wagon"]["cargo-wagon"].drive_over_tie_trigger,
      drive_over_tie_trigger_minimal_speed = 0.5,
      tie_distance = 50,
      working_sound = sounds.train_wagon_wheels,
      crash_trigger = crash_trigger(),
      open_sound = wood_logistics_sounds.wood_cargo_wagon_open,
      close_sound = wood_logistics_sounds.wood_cargo_wagon_close,
      impact_category = "wood",
      water_reflection = data.raw["cargo-wagon"]["cargo-wagon"].water_reflection,
      door_opening_sound = {
        sound = {
          filename = "__base__/sound/cargo-wagon/cargo-wagon-opening-loop.ogg",
          volume = 0.25,
          aggregation = {max_count = 1, remove = true, count_already_playing = true}
        },
        stopped_sound = {
          filename = "__wood-logistics__/sound/wood-cargo-wagon/wood-cargo-wagon-opened.ogg",
          volume = 0.3,
          aggregation = {max_count = 1, remove = true, count_already_playing = true}
        }
      },
      door_closing_sound = {
        sound = {
          filename = "__base__/sound/cargo-wagon/cargo-wagon-closing-loop.ogg",
          volume = 0.25,
          aggregation = {max_count = 1, remove = true, count_already_playing = true}
        },
        stopped_sound = {
          filename = "__wood-logistics__/sound/wood-cargo-wagon/wood-cargo-wagon-closed.ogg",
          volume = 0.3,
          aggregation = {max_count = 1, remove = true, count_already_playing = true}
        }
      }
    }
  })
end

-------------------------------------------------------------------------- Electric poles

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "electric-pole",
      name = "big-wood-electric-pole",
      icon = "__wood-logistics__/graphics/icons/big-wood-electric-pole.png",
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "big-wood-electric-pole"},
      max_health = 150,
      corpse = "big-wood-electric-pole-remnants",
      dying_explosion = "big-wood-electric-pole-explosion",
      resistances = {{type="fire", percent=-90}},
      collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
      selection_box = {{-1, -1}, {1, 1}},
      damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5},{0.5, 0.5}}),
      drawing_box = {{-1, -3}, {1, 0.5}},
      maximum_wire_distance = 24,
      supply_area_distance = 2,
      impact_category = "wood",
      open_sound = sounds.electric_network_open,
      close_sound = sounds.electric_network_close,
      fast_replaceable_group = "big-electric-pole",
      pictures = {
        layers = {
          {
            filename = "__wood-logistics__/graphics/entity/big-wood-electric-pole/hr-big-wood-electric-pole.png",
            priority = "extra-high",
            width = 148,
            height = 312,
            direction_count = 4,
            shift = util.by_pixel(0, -51),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
            priority = "extra-high",
            width = 374,
            height = 94,
            direction_count = 4,
            shift = util.by_pixel(60, 0),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      connection_points = data.raw["electric-pole"]["big-electric-pole"].connection_points,
      radius_visualisation_picture = {
        filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
        width = 12,
        height = 12,
        priority = "extra-high-no-scale"
      },
      water_reflection = {
        pictures = {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 32,
          shift = util.by_pixel(0, 60),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  })
end
