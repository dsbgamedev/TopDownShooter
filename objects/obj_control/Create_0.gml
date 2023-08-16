/// @description Insert description here
// You can write your code in this editor

//Inicia room
inicia_room = function()
{
	//Criando o screeshacke
	instance_create_layer(x,y,layer,obj_screenshake);
	
	//Criando o Player
	var _x = irandom_range(0 + 100, room_width  - 100);
	var _y = irandom_range(0 + 100, room_height - 100);
	instance_create_layer(_x,_y,"Player",obj_player);
	
	gera_inimigos();
	
}

gera_inimigos = function()
{
	//Definindo a quantidade de inimigos
	var _qtd = irandom_range(3,7);
	
	repeat(_qtd)
	{
		//Escolhendo uma posição aleatorio para os inimigos
		var _x = irandom_range(100, room_width  - 100);
		var _y = irandom_range(100, room_height - 100);
		//Instanciando o inimigo
		var _inimigo = instance_create_layer(_x,_y, "Inimigos", obj_inimigo02);
		//Checando a distancia do player
		if(instance_exists(obj_player))
		{
			//Pegando a distância do inimigo para o player
			var _dist = point_distance(_inimigo.x,_inimigo.y,obj_player.x,obj_player.y);
			//Se a distancia for muito curta, eu mato o inimigo
			if(_dist < 300)
			{
				//Destruindo o inimigo sem excutar o destroy dele
				instance_destroy(_inimigo, false);

			}
		}
	}
	
}









