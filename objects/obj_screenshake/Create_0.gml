/// @description Insert description here
// You can write your code in this editor

//Se alguem der o valor pro shake ele ativa

global.shake = 0;

treme_tela = function()
{
	//Movendo a tela com base no valor do shake
	view_xport[0] = random_range(-global.shake, global.shake); //tela vai pra direita e esquerda
	view_yport[0] = random_range(-global.shake, global.shake);
	
	//Se o valor do shake for maior do que 0, eu diminuo ele
	if(global.shake > 0)
	{
		global.shake *= 0.9;
		
		//Se o valor estiver muito proximo de 0, eu coloco ele em zero
		if(global.shake <= 0.1) global.shake = 0;
	}
	
}






