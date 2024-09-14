// Define the enemy's properties
speed = 1;
// Calculate the direction towards the player
direction = point_direction(x, y, obj_Player.x, obj_Player.y);
image_angle = direction;

// Move towards the player
motion_add(direction, speed);

// Rest of the code for arrow detection and dodging

shield.x = x; // Update the shield position to follow the enemy
shield.y = y;
shield.image_angle = direction; // Update the shield angle to match the enemy direction
shield.image_xscale = image_xscale; // Update the shield scale to match the enemy scale

sword.x = x; 
sword.y = y;
// Removed this line: sword.image_angle = direction; 
sword.image_xscale = image_xscale;

// Create a DS list to store the IDs of colliding arrows
var arrow_list = ds_list_create();

// Check for collisions with arrows within a 300 pixel radius
var num_arrows = collision_circle_list(x, y, 300, obj_Arrow, false, true, arrow_list, false);

// If there are any arrows, calculate the best dodge direction
if (num_arrows > 0) {
    // Calculate the vector between the enemy and the player
    var playerVectorX = obj_Player.x - x;
    var playerVectorY = obj_Player.y - y;
    
    // Initialize the dodge angle to be opposite to the player vector
    var dodgeAngle = point_direction(0, 0, -playerVectorX, -playerVectorY);
    
    // Loop through the arrows and adjust the dodge angle based on their positions and angles
    for (var i = 0; i < num_arrows; i++) {
        // Get the ID of the current arrow
        var arrow = arrow_list[| i];
        
        // Calculate the angle between the player and the arrow
        var playerToArrowAngle = point_direction(obj_Player.x, obj_Player.y, arrow.x, arrow.y);
        
        // Calculate the angle difference between the dodge angle and the player-to-arrow angle
        var angleDiff = angle_difference(dodgeAngle, playerToArrowAngle);
        
        // If the angle difference is less than a threshold (say 45 degrees), then add an offset to the dodge angle
        var angleThreshold = 45;
        var dodgeAngleOffset = 30;
        if (abs(angleDiff) < angleThreshold) {
            dodgeAngle += sign(angleDiff) * dodgeAngleOffset;
        }
    }    
    // Calculate the dodge position
    var dodgeDistance = 64;
    var dodgeX = x + lengthdir_x(dodgeDistance, dodgeAngle);
    var dodgeY = y + lengthdir_y(dodgeDistance, dodgeAngle);    
    // Calculate the distance between the enemy and the dodge position
    var distanceToDodge = point_distance(x, y, dodgeX, dodgeY);    
    // Move towards the dodge position if it's closer to the enemy than the player
    if (distanceToDodge < point_distance(x, y, obj_Player.x, obj_Player.y)) {
        // Move towards the dodge position
        var moveSpeed = 4;
        x += lengthdir_x(moveSpeed, dodgeAngle);
        y += lengthdir_y(moveSpeed, dodgeAngle);
    }
}
// Destroy the DS list
ds_list_destroy(arrow_list); 