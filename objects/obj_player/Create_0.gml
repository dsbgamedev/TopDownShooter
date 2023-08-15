/// @description Insert description here
// You can write your code in this editor

velocidade = 5;
velh	   = 0
velv       = 0;
vel_tiro   = 10

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
		}
	}
	else //Espera tiro é maior do que 0, então eu diminuo ela
	{
		espera_tiro --;
	}
	
}





