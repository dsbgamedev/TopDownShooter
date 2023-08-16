/// @description Insert description here
// You can write your code in this editor

//Herdar as informaçoes do meu pai
event_inherited();

//Váriaveis do time de movimento
timer_movimento = room_speed * random_range(4,10);
//Distancia para ele seguir o player
distancia       = 200;
//Variavel de vida
vida            = 1;
//Variavel shake
shake           = 5;
//Velocidade maxima
vel_max         = 2;
//Pedaços Inimigo
ped_min         = 5;
ped_max         = 10;
//Tempo 
temp_min        = 5;
temp_max        = 10;

define_movimento();

