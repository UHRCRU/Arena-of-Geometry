// Check if the other object is obj_Enemy

if (other.object_index == obj_Enemy) {
    // Destroy the arrow object
    instance_destroy();
}
/*
var enemy = other.id; // get the instance ID of the enemy
enemy.image_angle += 90;
instance_destroy();
obj_Game.alarm[0] = 120;