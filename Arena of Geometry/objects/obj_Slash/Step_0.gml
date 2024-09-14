// Adjust the slash duration as needed
var slashDuration = 10;

if (slashDuration > 0) {
    // Move the slash effect forward
    motion_add(image_angle, speed);
    
    // Decrease the slash duration
    slashDuration--;
} else {
    // Destroy the slash object after the slash duration is over
    instance_destroy();
}