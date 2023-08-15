/// @description Insert description here
// You can write your code in this editor

//Iniciando grande
image_xscale = 4;
image_yscale = image_xscale; //isso mantem a proporção dos angulos

//Tempo de espera para destruir o tiro
demora_morte = room_speed * 4;

//Metodo destruindo tiro
morrendo = function()
{
	//Diminuindo o valor da demora_morte
	demora_morte--;
	
	//Morrendo SE a demora morte chegou a 0
	if(demora_morte <= 0) instance_destroy();
}

//Método voltando o tiro ao tamanho original
efeito_tamanho = function()
{
	image_xscale = lerp(image_xscale,1, 0.1);
	image_yscale = image_xscale;
}

//Metodo de efeito e desenho
efeito_tiro = function()
{
	//Me desenhando
	draw_self();
	
	//Mudando o blendmode
	gpu_set_blendmode(bm_add);
	//Desenhando a sprite do efeito
	draw_sprite_ext(spr_tiro_efeito,0,x,y,image_xscale *1.1,image_yscale * 1.1,image_angle,c_red,0.7);
	gpu_set_blendmode(bm_normal);
}







