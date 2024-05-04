#define Main

posx = x;
posy = y;

global.spr_lucky_block = sprite_add("sprites/structures/lucky_block.png", 1, false, false, 16, 16)
global.spr_lucky_potion = sprite_add("sprites/items/lucky_potion.png", 1, false, false, 20, 20)
global.spr_test_item = sprite_add("sprites/wings/rainbow_wings.png", 1, false, false, 16, 16)

global.spr_rainbow_wings = sprite_add("sprites/wings/rainbow_wings.png", 6, false, false, 19, 24)

global.lucky_number = 0;
global.randomly = 0;

global.fishinglogoutput = "false";

modloaded = "Lucky Block|   Loaded Herobrine`s Lucky Block Mod"
modloaded2 = "Lucky Block|   Special Thanks to rarbin!"
spaceholder = "----------------------------------------------------------------"
version = "Version: V.1.0"
newest = "Newest:"
newesttext = "Mod Release [20 Events only ATM]"

testitemname = "Test Item"
testitemdesc = "A Item for testing my mod"

global.enemyspawnedtext = "Enemys Spawned Nearby!"

var max_lucky_number = 100
var min_lucky_number = 1

//Loaded Messages
Trace(spaceholder)
Trace(modloaded)
Trace(modloaded2)
Trace(version)
Trace(newest)
Trace(newesttext)
Trace(spaceholder)


    
    // ItemEdit(Item.Fiber, , [Item.Flower, 5])

    // Create a new item
    global.itemTestItem2 = ItemCreate(
    //should stay undefined
    undefined,
     //name of the Item
    "Test Item",
    //description of the item
    "Test",
    //Sprite of the item
    global.spr_test_item,
    //ItemType
    ItemType.Material,
    //ItemSubType
    ItemSubType.None,
    //Sell Value
    0,
    //Healing Value
    0,
    //Energy Value
    0,
    //Blueprint (Recipe)
    [Item.IronIngot, 20, Item.NightShade, 5],
    //ScriptWrapper
    ScriptWrap(doTest),
    //Crafting Time
    60 * 1,
    //Unlocked (true/false)
    false
    );
    
    //Horde
    
    global.enemyhorde = EnemyCreate(
    undefined,
    "Minion",
    EnemyType.Raider,
    1,
    5,
    180,
    200,
    1,
    2,
    ScriptWrap(enemyspawned))
    
    //Boss
    
    global.enemyboss = EnemyCreate(
    undefined,
    "Skeleton Boss!",
    EnemyType.Raider,
    10,
    500,
    500,
    1000,
    2,
    8,
    ScriptWrap(bossspawned))
    
    //Potion
    
    global.luckyPotion = ItemCreate(
    undefined,
    "Lucky Potion",
    "Drink and see what is hapening!",
    global.spr_lucky_potion,
    ItemType.Consumable,
    ItemSubType.Potion,
    1000,
    0,
    0,
    [Item.Bottle, 5, 211, 5],
    ScriptWrap(potionscript),
    60 * 10,
    true
    );
    
    //Crafting Recipe [Lucky Potion]
    
    StructureAddItem(Structure.Forge, global.luckyPotion)
    
    //Wings Cosmetic
    
    global.rainbow_wings = CosmeticCreate(
    undefined,
    "Rainbow Wings",
    CosmeticType.Wings,
    global.spr_rainbow_wings,
    global.spr_rainbow_wings,
    undefined,
    false);
    
    //Info Command
    
    global.logcmd = CommandCreate(
    "luckyinfo",
    true,
    ScriptWrap(infomessage)
    )
    
#define OnLoad   
    
//    global.mobspawn = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn3 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn4 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn5 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn2 = ModEnemySpawn(x, y, depth, global.enemyboss);

#define doTest
if (x == 100){
    
}

#define potionscript (max_lucky_number, min_lucky_number, lucky_number)

lucky_number = irandom_range(1, 20)

if (lucky_number == 1) {
    Trace ("You Got Nothing!")
} else if(lucky_number == 2) {
    GainItem(Item.Stone, 100)
    Trace ("Have fun with your Stones xD")
} else if(lucky_number == 3) {
    GainItem(global.luckyPotion, 1)
    Trace ("Try again dude...")
} else if(lucky_number == 4) {
    Trace("At this Point there should have Spawned a Boss but the API isnt so far to handle it correctly :(")
    GainItem(Item.GoldIngot, 5)
    Trace("I give you gold but pls Stop open that :D")
//    mobspawn = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    Trace ("I think u should stop open That")
} else if(lucky_number == 5) {
    DmgPlayer(2, false)
    Trace ("Ouh that hurts...")
} else if(lucky_number == 6) {
    Trace ("Here is your price a simple Message by me.")
} else if(lucky_number == 7) {
    RemoveItem(Item.IronIngot, 10)
    Trace ("Ooops ive lost 10 of your Iron!")
} else if(lucky_number == 8) {
    CosmeticSet(CosmeticType.Wings, global.rainbow_wings)
    Trace ("You unlocked my Rainbow Wings [if u dont have it already...]")
} else if(lucky_number == 9) {
    GainItem(Item.IronIngot, 1)
    Trace ("At the Bottom of the Bottle was an Iron Ingot!")
} else if(lucky_number == 10) {
//    global.mobspawn2 = ModEnemySpawn(x, y, depth, global.enemyboss);
} else if(lucky_number == 11) {
    RemoveItem(Item.Wood, 100)
    Trace ("Uhm i burned down 100 Wood from your Inventory cause it was cold...")
    Trace ("Sorry...")
} else if(lucky_number == 12) {
    GainItem(global.itemTestItem2, 1)
    Trace ("Uhm you should never get that Item... -_-")
} else if(lucky_number == 13) {
    RemoveItem(Item.Berry, 100000000000)
    Trace ("I was Hungry sooooo i decided to eat all your berrys")
} else if(lucky_number == 14) {
    GainItem(Item.Fish, 1)
    Trace ("Jackpot!")
    Trace ("You got a Fish :D")
} else if(lucky_number == 15) {
    GainItem(Item.Stone, 100)
    Trace ("Have fun with your Stones xD")
} else if(lucky_number == 16) {
    RemoveItem(global.luckyPotion, 1)
    Trace ("You have spilled a Lucky Potion!")
} else if(lucky_number == 17) {
    Trace ("You got Randomly a Random Item")
    var randomly = irandom_range(1, 50)
    GainItem(randomly, 1)
} else if(lucky_number == 18) {
    Trace ("Epic! You got a Lucky Block... Well there is no Lucky Block at this Point so im Sorry")
    GainItem(192, 1)
} else if(lucky_number == 19) {
    GainItem(120, 1)
    Trace ("Now you have a Shovel if u didnt had one before...")
} else if(lucky_number == 20){
      Trace("Now should Spawn a Mob But i sadly had do remove it cause the API isnt so far to do this. :(")
      Trace("You get Nothing Instead of. Sorry")
      var mobspawn1 = ModEnemySpawn(x+12, y+12, depth, global.enemyhorde);
      var mobspawn2 = ModEnemySpawn(x-12, y-12, depth, global.enemyhorde);
      var mobspawn3 = ModEnemySpawn(x+12, y-12, depth, global.enemyhorde);
      var mobspawn4 = ModEnemySpawn(x-12, y+12, depth, global.enemyhorde);
//    global.mobspawn3 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn4 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    global.mobspawn5 = ModEnemySpawn(x, y, depth, global.enemyhorde);
//    Trace(global.enemyspawnedtext)
} else if (lucky_number <= 21){
    Trace ("Error[1] If u get this Error pls tell me so i can try to fix it!")
    Trace ("I think it Shouldnt be Possible to get this Message but if it is tell me pls.")
}

#define OnStep
//if (instance_exists(objPlayer)) {
    
//    if (objPlayer.hp <= 0) {
    

    
//        if (instance_exists(global.mobspawn)){
            
//            for(k=0; k<instance_number(global.mobspawn); k++) {

//                instance_destroy(global.mobspawn) 

//            }

//        }

//        if (instance_exists(global.mobspawn2)){
            
//            for(j=0; j<instance_number(global.mobspawn2); j++) {

//                instance_destroy(global.mobspawn2) 

//            }

//        }

//        if (instance_exists(global.mobspawn3)){
            
//            for(i=0; i<instance_number(global.mobspawn3); i++) {

//                instance_destroy(global.mobspawn3) 

//            }

//        }
        
//        if (instance_exists(global.mobspawn5)){
            
//            for(g=0; g<instance_number(global.mobspawn5); g++) {

//                instance_destroy(global.mobspawn5) 

//            }

//        }

//        if (instance_exists(global.mobspawn4)){
            
//            for(l=0; l<instance_number(global.mobspawn4); l++) {

//                instance_destroy(global.mobspawn4) 

//            }

//        }

//    }

//}


#define enemyspawned
if (objPlayer.hp <= 0) {
    //instance_destroy(id, true)
}
Trace("")

#define bossspawned
Trace("A Skeleton Boss Spawned!")
//hpleft = EnemyGet(global.enemyboss, hp)
Trace("Hp:")
//Trace(hpleft)

#define infomessage
Trace("I've made also the Fishing Mod so check it out if u like")
Trace("You are currently on: Lucky Block Mod [Version: 1.0]")
Trace("There are 20 Events so far!")