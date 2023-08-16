/// @description Insert description here
// You can write your code in this editor

//Se eu devo ou não dar dano nos inimigos
dar_dano = false;

//Colisão com o inimigo
colidindo = function()
{
	if(dar_dano)	
	{
		//Checando se eu colidi com o inimigo
		var _inimigo = instance_place(x,y, obj_inimigo_pai);
		if(_inimigo)
		{
			//Executando a função de dano do inimigo
			_inimigo.levar_dano(1);
			
			//Destruindo o pedaço
			instance_destroy();
		}
	}
}






