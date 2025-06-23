local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
local recipe_category = settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"

-------------------------------------------------------------------------- Intermediates

if settings.startup["wood-logistics-lumber"].value then
  data:extend({
    {
      type = "recipe",
      name = "lumber",
      category = recipe_category,
      allow_productivity = true,
      energy_required = 1,
      ingredients = {
        mods["expensive-mode"] and {type="item", name="wood", amount=4} or {type="item", name="wood", amount=2}
      },
      results = {{type="item", name="lumber", amount=1}},
    }
  })
end

if settings.startup["wood-logistics-woodtronics"].value then
  data:extend({
    {
      type = "recipe",
      name = "electronic-circuit-from-wood",
      icons = {
        {icon="__base__/graphics/icons/electronic-circuit.png"},
        {icon=data.raw.item[lumber_item].icon, shift={-12, -12}, scale=0.4, draw_background=true}
      },
      category = data.raw.recipe["electronic-circuit"].category,
      order = "b[circuits]-a[a-electronic-circuit]",
      enabled = false,
      allow_productivity = true,
      energy_required = 1,
      ingredients = {
        {type="item", name=lumber_item, amount=1},
        {type="item", name="copper-cable", amount=5}
      },
      results = {{type="item", name="electronic-circuit", amount=2}},
      main_product = "electronic-circuit"
    }
  })
end

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-transport-belt",
      enabled = not mods["aai-industry"],
      category = recipe_category,
      ingredients = {
        {type="item", name=lumber_item, amount=1},
        {type="item", name="copper-cable", amount=2}
      },
      results = {{type="item", name="wood-transport-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-underground-belt",
      category = recipe_category,
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name=lumber_item, amount=1},
        {type="item", name="wood-transport-belt", amount=4}
      },
      results = {{type="item", name="wood-underground-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-splitter",
      category = recipe_category,
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name=lumber_item, amount=2},
        {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=2}
      },
      results = {{type="item", name="wood-splitter", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "recipe",
      name = "lumber-mill",
      category = "advanced-crafting-or-carpentry",
      enabled = false,
      energy_required = 20,
      ingredients = {
        {type="item", name=lumber_item, amount=80},
        mods["space-age"] and {type="item", name="tungsten-plate", amount=20} or {type="item", name="steel-plate", amount=40},
        {type="item", name="processing-unit", amount=10},
        {type="item", name="electric-engine-unit", amount=5}
      },
      results = {{type="item", name="lumber-mill", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Trains

if settings.startup["wood-logistics-cargo-wagon"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-cargo-wagon",
      category = recipe_category,
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type="item", name="iron-gear-wheel", amount=10},
        {type="item", name="copper-plate", amount=10},
        {type="item", name=lumber_item, amount=20}
      },
      results = {{type="item", name="wood-cargo-wagon", amount=1}}
    }
  })
end
