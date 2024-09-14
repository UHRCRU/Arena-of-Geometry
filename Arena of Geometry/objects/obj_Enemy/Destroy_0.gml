/// @description Insert description here
// You can write your code in this editor
// Destroy the sword and shield objects when the enemy is destroyed
with (obj_Sword) {
    instance_destroy();
}
with (obj_Shield) {
    instance_destroy();
}
room_goto(rm_Win);