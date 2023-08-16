/// @description Insert description here
// You can write your code in this editor

velocidade = 5;
velh	   = 0
velv       = 0;
vel_tiro   = 10;
dano       = 2;
inv        = false;
inv_tempo  = room_speed * 3;
inv_timer  = 0;
alpha_val  = 0.05;

espera_tiro = 0;
demora_tiro = room_speed * 0.2;//Meu tiro vai funcionar em 0.2 segundos


movimentacao = function()
{
	var _up, _down, _left, _right;
	
	//Pegando o input do usuário
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	//Checando para onde ele se move
	velv = (_down - _up) * velocidade;
	//Alterando o eixo Y (movimentando na vertical)
	y  += velv;
	
	//Alterando o eixo X (movimentando na horizontal)
	velh = (_right - _left) * velocidade;
	x += velh;
	
	//Controlando a animação
	if(_up || _down or _left || _right)
	{
		image_speed = 1;
	}
	else//Não estou me movendo
	{
		image_speed = 0;
		//image_index = 0;
	}
	
}

atirando =  function()
{
	//Pegando a direção do player em relação ao mouse
	var _dir = point_direction(x,y, mouse_x,mouse_y);
	//Fazendo o Player olhar para a direção do mouse
	image_angle = _dir;
	
	//Checando se estou aperando o botao do mouse esquerdo 
	var _fire = mouse_check_button(mb_left);
	
	//Só posso atirar SE o tiro for 
	if(espera_tiro <= 0)
	{
		if(_fire)
		{
			var _tiros = instance_create_layer(x,y,"Tiros", obj_tiro_player);
			_tiros.direction = _dir ;
			_tiros.speed = vel_tiro;	
			
			//Atirei? Então eu reseto o valor da espera do tiro
			espera_tiro = demora_tiro;	
			
			//Usando a sprite do tiro
			sprite_index = spr_player_tiro;
		}
		else
		{
			sprite_index = spr_player_strip8;	
		}
	}
	else //Espera tiro é maior do que 0, então eu diminuo ela
	{
		espera_tiro --;
	}
	
}

levar_dano = function()
{
	//Checando se eu colidi com o inimigo
	var _inimigo = instance_place(x,y, obj_inimigo_pai);
	//Levando dano apenas se eu não estou invencivel
	if(_inimigo && inv == false)
	{
		global.vida -= _inimigo.dano;
		//Ficando invencivel
		inv_timer = inv_tempo;
	}
	//Morrendo
	if(global.vida < 0)
	{
	  //Me destruindo
	  instance_destroy();
	}
	
}

//Perdendo invencibilidade
invencivel = function()
{
	if(inv_timer <= 0)
	{
		//Deixo de ser invencivel
		inv = false;
		//Eu fico visivel
		image_alpha = 1;
	}
	else
	{
		inv_timer--;
		inv = true;
		//Alerando o imagem_alpha
		image_alpha += alpha_val;
		//Alterando o alpha_val com base na transparencia
		if(image_alpha > 1 or image_alpha < 0) alpha_val *= -1;	
	
	}
	
	
}



