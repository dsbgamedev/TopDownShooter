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

//Método inimigo persegue o player se estiver proximo
seguir_player = function()
{
	//Checando a minha distancia para o player	
	//Checando se o Player existe
	if(instance_exists(obj_player))
	{
		//Pegando a distancia
		var _dist_player = point_distance(x,y,obj_player.x,obj_player.y);
		
		//Seguindo o player SE ele estiver muito proximo
		if(_dist_player < distancia)
		{
			//Pegando a direção do Player
			var _dir = point_direction(x,y,obj_player.x,obj_player.y);
			direction = _dir;
			//usando uma velocidade padrão
			speed = 1;
		}
	}
	
	
}


