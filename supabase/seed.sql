-- Seed data for Nexus Vault game virtual goods marketplace
-- This file contains 50+ diverse virtual items from various game genres

-- Weapons (15 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Dragon Slayer Blade', 'A legendary sword forged from dragon scales, dealing massive fire damage to all enemies.', 2999.99, 'weapons', 'Legendary', 'Eternal Realms Online', 3, ARRAY['sword', 'fire', 'dragon', 'melee'], true),
('Plasma Rifle X-900', 'Advanced energy weapon with unlimited ammo. Perfect for intergalactic bounty hunters.', 1899.50, 'weapons', 'Epic', 'Starfield Warriors', 12, ARRAY['rifle', 'energy', 'ranged', 'sci-fi'], true),
('Shadowstrike Daggers', 'Twin daggers that grant invisibility on critical hits. Favored by assassins.', 1499.00, 'weapons', 'Rare', 'Shadow Chronicles', 8, ARRAY['daggers', 'stealth', 'melee', 'critical'], false),
('Thunder Hammer', 'Massive two-handed hammer that calls down lightning strikes.', 1299.99, 'weapons', 'Epic', 'Gods of Thunder', 5, ARRAY['hammer', 'lightning', 'melee', 'aoe'], false),
('Mystic Staff of Eternity', 'Ancient staff that amplifies magic power by 200%. Required level: 80.', 3499.00, 'weapons', 'Legendary', 'Mage Quest', 2, ARRAY['staff', 'magic', 'legendary', 'amplifier'], true),
('Dual SMGs "Hellfire"', 'Rapid-fire submachine guns with incendiary rounds.', 899.99, 'weapons', 'Rare', 'Urban Warfare', 20, ARRAY['smg', 'fire', 'dual-wield', 'rapid'], false),
('Crystal Bow of Light', 'Ethereal bow that shoots arrows of pure light energy.', 1699.00, 'weapons', 'Epic', 'Elven Kingdoms', 7, ARRAY['bow', 'light', 'ranged', 'magical'], false),
('Chainsaw Sword', 'Brutally effective hybrid weapon. Loud and proud.', 799.50, 'weapons', 'Uncommon', 'Wasteland Survivors', 15, ARRAY['chainsaw', 'melee', 'brutal', 'hybrid'], false),
('Void Scythe', 'Harvests souls from the void dimension. Lifesteal +50%.', 2499.99, 'weapons', 'Legendary', 'Dark Harvest', 4, ARRAY['scythe', 'void', 'lifesteal', 'dark'], true),
('Basic Iron Sword', 'Standard issue iron sword. Reliable starter weapon.', 49.99, 'weapons', 'Common', 'Generic RPG', 100, ARRAY['sword', 'starter', 'melee', 'basic'], false),
('Sniper Rifle "Ghost"', 'Ultra-long range precision rifle with thermal scope.', 1599.00, 'weapons', 'Rare', 'Tactical Ops', 10, ARRAY['sniper', 'precision', 'thermal', 'ranged'], false),
('Flaming Greatsword', 'Enormous blade engulfed in eternal flames.', 1899.00, 'weapons', 'Epic', 'Inferno Knights', 6, ARRAY['greatsword', 'fire', 'melee', 'two-handed'], false),
('Poison Blow Darts', 'Set of 50 darts coated with paralytic toxin.', 299.99, 'weapons', 'Uncommon', 'Jungle Tribes', 35, ARRAY['darts', 'poison', 'stealth', 'ranged'], false),
('Laser Katana', 'Futuristic blade combining traditional craftsmanship with laser technology.', 2199.99, 'weapons', 'Epic', 'Neo Tokyo 2099', 8, ARRAY['katana', 'laser', 'melee', 'cyber'], true),
('Rusty Dagger', 'A worn but functional blade. Better than nothing.', 15.00, 'weapons', 'Common', 'Medieval Adventure', 200, ARRAY['dagger', 'basic', 'starter', 'melee'], false);

-- Armor (12 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Titanium Exo-Suit', 'Military-grade powered armor with shield generator. Defense +500.', 4999.99, 'armor', 'Legendary', 'Starfield Warriors', 2, ARRAY['exo-suit', 'tech', 'shields', 'heavy'], true),
('Dragon Scale Mail', 'Impenetrable armor crafted from ancient dragon scales. Fire resistance +80%.', 3299.00, 'armor', 'Epic', 'Eternal Realms Online', 5, ARRAY['dragon', 'fire-resist', 'heavy', 'scales'], true),
('Shadow Assassin Cloak', 'Grants +50 stealth and becomes invisible in darkness.', 1899.50, 'armor', 'Rare', 'Shadow Chronicles', 10, ARRAY['cloak', 'stealth', 'light', 'invisibility'], false),
('Holy Paladin Plate', 'Blessed armor that regenerates health over time. Faith +100.', 2799.99, 'armor', 'Epic', 'Divine Crusade', 4, ARRAY['plate', 'holy', 'regeneration', 'heavy'], false),
('Cyber Ninja Suit', 'Lightweight nano-fiber suit with enhanced mobility.', 2199.00, 'armor', 'Rare', 'Neo Tokyo 2099', 8, ARRAY['suit', 'mobility', 'light', 'tech'], false),
('Leather Armor', 'Standard leather protection. Basic defense for beginners.', 99.99, 'armor', 'Common', 'Generic RPG', 150, ARRAY['leather', 'basic', 'starter', 'light'], false),
('Mage Robes of Wisdom', 'Enchanted robes that increase mana regeneration by 200%.', 1499.99, 'armor', 'Rare', 'Mage Quest', 12, ARRAY['robes', 'mana', 'cloth', 'magic'], false),
('Wasteland Scrap Armor', 'Cobbled together from car parts and metal scraps. Surprisingly effective.', 699.50, 'armor', 'Uncommon', 'Wasteland Survivors', 18, ARRAY['scrap', 'medium', 'improvised', 'post-apocalyptic'], false),
('Crystal Guardian Shell', 'Living crystal armor that repairs itself. Magic defense +90%.', 3899.00, 'armor', 'Legendary', 'Crystal Caverns', 3, ARRAY['crystal', 'self-repair', 'magic', 'legendary'], true),
('Tactical Vest Mark VII', 'Military-grade body armor with ammunition pouches.', 899.99, 'armor', 'Uncommon', 'Tactical Ops', 25, ARRAY['vest', 'tactical', 'medium', 'military'], false),
('Elven Silk Robes', 'Elegant robes woven from magical silk. Charisma +30.', 1299.00, 'armor', 'Rare', 'Elven Kingdoms', 9, ARRAY['robes', 'silk', 'light', 'charisma'], false),
('Tattered Cloth Shirt', 'Basic clothing. Provides minimal protection.', 10.00, 'armor', 'Common', 'Medieval Adventure', 300, ARRAY['cloth', 'basic', 'starter', 'light'], false);

-- Skins (10 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Neon Samurai Outfit', 'Glowing cyberpunk samurai skin with reactive LED patterns.', 499.99, 'skins', 'Epic', 'Neo Tokyo 2099', 50, ARRAY['samurai', 'neon', 'cyber', 'glowing'], true),
('Dragon Emperor Costume', 'Majestic outfit with animated dragon effects and particle trails.', 799.99, 'skins', 'Legendary', 'Eternal Realms Online', 15, ARRAY['dragon', 'emperor', 'animated', 'premium'], true),
('Ghost Operative Skin', 'Tactical skin with subtle transparency effect.', 299.99, 'skins', 'Rare', 'Tactical Ops', 40, ARRAY['ghost', 'tactical', 'stealth', 'transparent'], false),
('Celestial Mage Robes', 'Ethereal robes with floating constellation effects.', 599.00, 'skins', 'Epic', 'Mage Quest', 20, ARRAY['celestial', 'mage', 'stars', 'ethereal'], false),
('Wasteland Raider Gear', 'Post-apocalyptic outfit with weathered leather and spikes.', 349.50, 'skins', 'Uncommon', 'Wasteland Survivors', 60, ARRAY['raider', 'leather', 'spikes', 'wasteland'], false),
('Elven Princess Dress', 'Beautiful gown with flower petal particle effects.', 449.99, 'skins', 'Rare', 'Elven Kingdoms', 30, ARRAY['princess', 'dress', 'flowers', 'elegant'], false),
('Inferno Demon Form', 'Transform into a being of pure flame. Extremely rare.', 999.99, 'skins', 'Legendary', 'Inferno Knights', 8, ARRAY['demon', 'fire', 'transformation', 'rare'], true),
('Basic Adventurer Garb', 'Standard outfit for new players.', 49.99, 'skins', 'Common', 'Generic RPG', 200, ARRAY['basic', 'starter', 'simple', 'common'], false),
('Void Walker Cloak', 'Dark cloak with swirling void energy effects.', 699.99, 'skins', 'Epic', 'Dark Harvest', 12, ARRAY['void', 'dark', 'cloak', 'energy'], false),
('Street Racer Outfit', 'Urban style with graffiti patterns and glow strips.', 399.00, 'skins', 'Rare', 'Urban Warfare', 35, ARRAY['street', 'urban', 'racer', 'glow'], false);

-- Gems (8 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Ruby of Eternal Flame', 'Socketed gem granting +200 fire damage and burn immunity.', 1999.99, 'gems', 'Legendary', 'Eternal Realms Online', 5, ARRAY['ruby', 'fire', 'socket', 'immunity'], true),
('Diamond of Protection', 'Increases all resistances by 50%. Can be socketed into any gear.', 2499.00, 'gems', 'Legendary', 'Generic RPG', 4, ARRAY['diamond', 'resistance', 'defense', 'socket'], true),
('Emerald of Life', 'Grants +500 HP and health regeneration +10/sec.', 1599.99, 'gems', 'Epic', 'Mage Quest', 10, ARRAY['emerald', 'health', 'regeneration', 'socket'], false),
('Sapphire of Wisdom', 'Increases mana pool by 300 and spell power by 15%.', 1399.00, 'gems', 'Epic', 'Mage Quest', 8, ARRAY['sapphire', 'mana', 'spell-power', 'socket'], false),
('Amethyst of Speed', 'Increases movement speed by 30% and attack speed by 20%.', 1199.99, 'gems', 'Rare', 'Shadow Chronicles', 15, ARRAY['amethyst', 'speed', 'agility', 'socket'], false),
('Topaz of Wealth', 'Increases gold and loot drop rate by 50%.', 899.99, 'gems', 'Rare', 'Treasure Hunters', 20, ARRAY['topaz', 'wealth', 'gold', 'loot'], false),
('Onyx of Darkness', 'Grants shadow damage and stealth bonuses.', 1799.00, 'gems', 'Epic', 'Dark Harvest', 7, ARRAY['onyx', 'shadow', 'stealth', 'socket'], false),
('Quartz Shard', 'Basic gem providing small stat boost.', 99.99, 'gems', 'Common', 'Generic RPG', 100, ARRAY['quartz', 'basic', 'common', 'socket'], false);

-- Cards (8 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Cosmic Dragon Card', 'Summon a cosmic dragon ally. 10000 ATK / 8000 DEF.', 2999.99, 'cards', 'Legendary', 'Mythic Card Battle', 3, ARRAY['dragon', 'cosmic', 'summon', 'legendary'], true),
('Void Assassin Card', 'Instantly destroy any creature with 5000 or less HP.', 1899.00, 'cards', 'Epic', 'Mythic Card Battle', 8, ARRAY['assassin', 'void', 'destruction', 'instant'], false),
('Healing Angel Card', 'Restore 5000 HP to your hero and all allies.', 1299.99, 'cards', 'Rare', 'Mythic Card Battle', 15, ARRAY['angel', 'healing', 'support', 'restoration'], false),
('Lightning Strike Card', 'Deal 3000 damage to all enemy creatures.', 1599.00, 'cards', 'Epic', 'Mythic Card Battle', 10, ARRAY['lightning', 'aoe', 'damage', 'spell'], false),
('Shield Wall Card', 'All your creatures gain +2000 DEF this turn.', 899.99, 'cards', 'Rare', 'Mythic Card Battle', 20, ARRAY['shield', 'defense', 'buff', 'support'], false),
('Fire Elemental Card', 'Summon a fire elemental. 4000 ATK / 3000 DEF.', 799.50, 'cards', 'Uncommon', 'Mythic Card Battle', 30, ARRAY['elemental', 'fire', 'summon', 'creature'], false),
('Mana Crystal Card', 'Increase your maximum mana by 2.', 599.99, 'cards', 'Uncommon', 'Mythic Card Battle', 40, ARRAY['mana', 'resource', 'utility', 'permanent'], false),
('Goblin Warrior Card', 'Basic creature card. 1000 ATK / 800 DEF.', 49.99, 'cards', 'Common', 'Mythic Card Battle', 150, ARRAY['goblin', 'warrior', 'basic', 'creature'], false);

-- Estates (7 items)
INSERT INTO public.products (name, description, price, category, rarity, game, stock, tags, featured) VALUES
('Sky Castle Penthouse', 'Floating castle in the clouds with private dragon landing pad. Guild capacity: 100.', 9999.99, 'estates', 'Legendary', 'Eternal Realms Online', 1, ARRAY['castle', 'sky', 'guild', 'luxury'], true),
('Cyber Apartment Block', 'High-rise apartment complex in Neo Tokyo downtown. 50 rooms.', 7499.00, 'estates', 'Epic', 'Neo Tokyo 2099', 2, ARRAY['apartment', 'cyber', 'urban', 'modern'], true),
('Elven Treehouse Village', 'Ancient tree converted into luxurious living space. One with nature.', 5999.99, 'estates', 'Epic', 'Elven Kingdoms', 3, ARRAY['treehouse', 'nature', 'elven', 'eco'], false),
('Underground Bunker', 'Fortified wasteland shelter with armory and workshop.', 4299.50, 'estates', 'Rare', 'Wasteland Survivors', 5, ARRAY['bunker', 'fortified', 'underground', 'survival'], false),
('Wizard Tower', 'Seven-story tower with alchemy lab and spell library.', 6999.00, 'estates', 'Epic', 'Mage Quest', 2, ARRAY['tower', 'magic', 'library', 'alchemy'], true),
('Beach House', 'Relaxing coastal property with ocean view.', 2999.99, 'estates', 'Rare', 'Paradise Island', 8, ARRAY['beach', 'coastal', 'relaxing', 'vacation'], false),
('Small Cottage', 'Cozy starter home with basic amenities.', 499.99, 'estates', 'Common', 'Generic RPG', 50, ARRAY['cottage', 'starter', 'basic', 'cozy'], false);

-- Set featured status for high-value items
UPDATE public.products SET featured = true
WHERE rarity = 'Legendary' OR price > 2000;
