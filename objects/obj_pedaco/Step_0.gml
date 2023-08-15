/// @description Insert description here
// You can write your code in this editor

//Perdendo velocidade
speed *= .9;

//Desaparecer
image_alpha -= 0.005;

//Me destruindo ao sumir totalmente
if(image_alpha <= 0) instance_destroy();







