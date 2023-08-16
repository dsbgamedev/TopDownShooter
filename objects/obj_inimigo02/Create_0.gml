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
ped_vel_min     = 40;
ped_vel_max     = 60;
dar_dano        = true;

timer_movimento = room_speed * random_range(temp_min, temp_max);

timer_ovo = room_speed * random_range(temp_min, temp_max);

define_movimento();

//Metodo botando ovo
bota_ovo = function()
{
	timer_ovo--;
	
	if(timer_ovo <= 0)
	{
		var _ovo       = instance_create_layer(x,y,"Inimigos", obj_ovo);
		_ovo.speed     = random(1);
		//Fazendo o vo ir na direção inversa que eu estou indo
		_ovo.direction = direction + 180;
		
		//Resetando o timer
		timer_ovo = room_speed * random_range(temp_min,temp_max);
	}
}










