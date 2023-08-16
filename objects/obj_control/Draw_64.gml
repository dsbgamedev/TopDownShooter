/// @description Desenhando na tela do jogo
// You can write your code in this editor

//Desenhnado a vida na superior esquerda
draw_text(20,20,"Vida :" + string(global.vida));
draw_text(20,40,"Level :" + string(global.level));

//
//
if(instance_exists(obj_inimigo02) && instance_exists(obj_player))
{
	//Procurando o inimigo grande mais proximo do player
	//Rodado codigo dentro do Player
	with(obj_player)
	{
		var _inimigo_prox = instance_nearest(x,y,obj_inimigo02);
		//Apontar par ao inimigo
		var _dir = point_direction(x,y,_inimigo_prox.x,_inimigo_prox.y);
		
		//Pegando a largura da view 
		var _widt = camera_get_view_width(view_camera[0]);
		//Desenhando a seta
		draw_sprite_ext(spr_seta,0, _widt / 2, 100,1,1, _dir,c_white,1);
	}
	
	
	//instance_nearest(obj_player.x, obj_player.y,obj_inimigo02);
}






