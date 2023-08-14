/// @description Insert description here
// You can write your code in this editor

velocidade = 5;
velh	   = 0
velv       = 0;

movimentacao = function()
{
	var _up, _down, _left, _height;
	
	//Pegando o input do usuário
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));
	_height = keyboard_check(ord("D"));
	
	//Checando para onde ele se move
	velv = (_down - _up) * velocidade;
	//Alterando o eixo Y (movimentando na vertical)
	y  += velv;
	
	//Alterando o eixo X (movimentando na horizontal)
	velh = (_height - _left) * velocidade;
	x += velh;
	
}






