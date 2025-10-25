local frep = require("__fdsl__.lib.recipe")

local recipe_category = settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"
local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

-- Lane Balancers mod support
-- Adopt update_icon function from lane-balancers mod
local function update_icon(prototype, prefix)
  prototype.icons =
  {
    {
      icon = ("__wood-logistics__/graphics/icons/" .. prefix .. "lane-splitter.png")
    },
  }
end


-- Adds wooden lane balancers that match the wood logistics belt tier
if mods["lane-balancers"] and settings.startup["wood-logistics-belts"].value then
  -- Use the lane_balancers_handle function exposed by the lane-balancers mod
  
    lane_balancers_handle({
      prefix = "wood-",
      tech = "wood-logistics",
      previous_prefix = nil, -- Wood tier is the lowest tier, no previous upgrade
      order = "A",
    })

  -- Make the yellow lane-splitter recipe use the wooden lane-splitter
  frep.replace_ingredient("lane-splitter", "transport-belt", {type="item", name="wood-lane-splitter", amount=2})
  
  end
    
  