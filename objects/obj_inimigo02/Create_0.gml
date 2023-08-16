/// @description Insert description here
// You can write your code in this editor

//Herdar as informaçoes do meu pai
event_inherited();

//Variavel de vida
vida            = 1;
//Variavel shake
shake           = 20;
//Velocidade maxima
vel_max         = 2;
//Pedaços Inimigo
ped_min         = 15;
ped_max         = 30;
//Tempo 
temp_min        = 10;
temp_max        = 20;
//Distancia para ele seguir o player
distancia       = 200;

timer_movimento = room_speed * random_range(temp_min, temp_max);

define_movimento();












