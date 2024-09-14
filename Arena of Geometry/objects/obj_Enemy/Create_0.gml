cooldown = 0; // initialize cooldown to zero

shield = instance_create_layer(x - 16, y - 16, "Instances", obj_Shield); //create the shield object with some offset
shield.image_angle = direction; //set the shield angle to match the enemy direction
shield.image_xscale = image_xscale; //set the shield scale to match the enemy scale
shield.parent = id; //set the parent of the shield to the enemy
shield.depth = layer_get_depth("Instances") + 1; //set the depth of the shield to be above the enemy

sword = instance_create_layer(x + 16, y + 16, "Instances", obj_Sword); //create the sword object with some offset
sword.image_angle = direction; 
sword.image_xscale = image_xscale; 
sword.parent = id; 
sword.depth = layer_get_depth("Instances") + 1; //set the depth of the sword to be below the enemy



