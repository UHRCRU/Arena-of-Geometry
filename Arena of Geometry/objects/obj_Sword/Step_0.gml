/// @description Insert description here
// You can write your code in this editor

/*
var rotationSpeed = 10;
if (collision_circle(x, y, 100, obj_Player, false, true,)) {
    // Rotate the sword by the rotation speed
    image_angle += rotationSpeed;
}
*/
var rotationSpeed = 10;
var attackDistance = 100; // Adjust the attack distance as needed
var attackCooldown = 0; // Adjust the cooldown duration as needed
var slashSpeed = 5; // Adjust the slash speed as needed
var slashDir = 1; // The direction of the slash, 1 for clockwise, -1 for counter-clockwise
var slashMax = 90; // The maximum angle that the sword can rotate

// Calculate the distance between obj_Sword and obj_Player
var distanceToPlayer = point_distance(x, y, obj_Player.x, obj_Player.y);

// Rotate the sword when the player is within attack range and the attack cooldown is over
if (distanceToPlayer <= attackDistance && attackCooldown <= 0) {
    image_angle += rotationSpeed;
    
    // Check if the sword has reached the maximum angle
    if (abs(image_angle - direction) >= slashMax) {
        // Reverse the slash direction
        slashDir *= -1;
    }
    
    // Perform the attack action
    if (abs(image_angle - direction) >= slashMax / 2) {
        speed = slashSpeed * slashDir;
    }
    else {
        speed = 0;
    }
    
    // Set the attack cooldown
    attackCooldown = 60; // 60 steps cooldown, adjust as needed
}
else {
    // Point the sword towards the player
    direction = point_direction(x, y, obj_Player.x, obj_Player.y);
    
    // Reset the sword rotation and speed when not attacking
    image_angle = direction;
    speed = 0;
}

// Decrease the attack cooldown
if (attackCooldown > 0) {
    attackCooldown--;
}

