/// @description Insert description here
// You can write your code in this editor

randomize();

global.level = 1;
global.vida  = 3;

reinicia_timer = room_speed;


//Inicia room
inicia_room = function()
{
	
	//Alterando as dimensões da room tem que ficar maior que mina viwe
	var _width  =  irandom_range(2000, 5000);
	var _heigth =  irandom_range(2000, 5000);
	room_width  = _width;
	room_height = _heigth;
	
	//Alterando o background da room
	//Escolhendo o background
	var _bg		 = choose(spr_bg,spr_bg2,spr_bg3);//Choose permite escolhe uma lista
	var _lay_id  = layer_get_id("Background");
	var _lay_bg  = layer_background_get_id(_lay_id);
	layer_background_sprite(_lay_bg, _bg);
	
	//Criando o screeshacke
	instance_create_layer(x,y,layer,obj_screenshake);
	
	//Criando o Player
	var _x = irandom_range(0 + 100, room_width  - 100);
	var _y = irandom_range(0 + 100, room_height - 100);
	instance_create_layer(_x,_y,"Player",obj_player);
	
	gera_inimigos();
	
}

//Metodo para gerar inimigos
gera_inimigos = function()
{
	//Definindo a quantidade de inimigos
	var _qtd = irandom_range(3,7) * global.level;
	
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

//Metodo passando de level
passa_level = function()
{
	//Checando quantos inimigos02 grandes existem
	var _qtd_inimigos = instance_number(obj_inimigo02);
	//Reiniciando o jogo se os inimigos tiverem acabados
	if(_qtd_inimigos <= 0) 
	{
		//Só reinicio quando o timer zerar
		reinicia_timer--;
		
		if(reinicia_timer <= 0)
		{
			//Aumentnado o level
			global.level++;
			room_restart();
			//Resetar time
			reinicia_timer = room_speed;
		}
	}
}









