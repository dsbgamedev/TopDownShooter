/// @description Insert description here
// You can write your code in this editor

//Iniciando grande
image_xscale = 4;
image_yscale = image_xscale; //isso mantem a proporção dos angulos

//Tempo de espera para destruir o tiro
demora_morte = room_speed * 4;

//Variavel de dano
dano = 1;

shake = 3;


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
	draw_sprite_ext(spr_impacta_tiro,0,x,y,image_xscale *1.1,image_yscale * 1.1,image_angle,c_red,0.7);
	gpu_set_blendmode(bm_normal);
}

//Metodo colidindo com o inimigo
colidi_inimigo = function()
{
	//este código vai tirar 1 de vida se eu colidir com o inimigo
	//e já que foi usado o instance place ele 
	//salva o ID da instância do inimigo que colidiu comigo, 
	//então eu posso destruir o inimigo passando a variável _inimigo 
	//no instance destroy
	
	//Variavel para checar colisão com algum objeto
	var _inimigo = instance_place(x,y,obj_inimigo01);
	
	//Se eu colidir com algum inimigo eu tiro vida dele e me mato
	if(_inimigo)
	{
	 _inimigo.levar_dano(dano);
      //Me destruindo
	  instance_destroy();
	  
	  //Criando o impacto
	  instance_create_layer(x,y,layer, obj_impacto_tiro);
	  
	 //Fazendo a tela tremer
	 //Checar se o valor que eu vou passar eh maior que o valor atual
	 //do screenshake
	 
	 if(global.shake < shake) global.shake = shake;
	  
	}
	
	
}







