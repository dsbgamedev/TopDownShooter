/// @description Insert description here
// You can write your code in this editor

//Variaveis comuns (atributos)
vida      = 1;
//Variavel shake
shake     = 1;
//Velocidade maxima
vel_max   = 1;
//Pedaços inimigos
ped_min   = 2;
ped_max   = 2;

//Tempo 
temp_min = 1;
temp_max = 2;

//Comportamentos comuns

//Metodo para ficar na room
ficar_room = function()
{
		//Olhar par aonde esta indo
		image_angle = direction;
	
		//Impedindo que ele sai na horizontal
		if(x - sprite_width/2 < 0 || x + sprite_width/2 > room_width)
		{
			hspeed *=-1;
		}	
		
		//Impedindo que ele saia na vertical
		if(y - sprite_height/2 < 0) vspeed *= -1;
		if(y + sprite_height/2 > room_height) vspeed *= -1;
}

//Metodo de levar dano 
///@method levar_dano(valor_dano);
levar_dano = function(_dano)
{
	//Garantindo que se a pessoa nao passar valor para do dano ele vai valer 1
	//Se o dano é indefinido ele e igual a 1
	if(_dano == undefined)//undefined significa que ele nao tem um valor definido
	{
		_dano = 1;	
	}
	//Perdendo vida 
	vida -= _dano
	//Se estou sem vida eu morro
	if(vida <= 0)
	{
		instance_destroy();
		
		//Me explodindo
		explodir();
		
		//Dando um valor para o screenshake
		if(global.shake < shake ) global.shake = shake;
	}
		
}

//Metodo explodir o inimigo
explodir = function()
{
	//Criando rastro
	var _rastro = instance_create_layer(x,y,"Tiros", obj_rastro);
	//Angulo aleatorio para meu rastro
	_rastro.image_angle = irandom(35);
	//Criando um numero aleatorio de pedaços
	var _qtd = irandom_range(ped_min,ped_max);
	
	repeat(_qtd)//repete o valor da variavel _qtd
	{
		//Instanciando o pedaço
		var _pedaco = instance_create_layer(x,y,"Tiros",obj_pedaco);
		//Dando velocidade ao pedaco
		_pedaco.speed = random_range(8,15);
		//Dando uma direcao aleatorio ao pedaco
		_pedaco.direction = irandom(359);
		//fazendo ele olhar para onde vai
		_pedaco.image_angle = _pedaco.direction;
	}
	
}

//Metodo meu timer para mudar de movimento 
mudar_movimento = function()
{
	//Diminuir o timer
	timer_movimento--;
	
	if(timer_movimento <= 0)
	{
		define_movimento();
		
		//Resetando o timer
		timer_movimento = room_speed * random_range(temp_min, temp_max);	
	}

}

//Metodo para definir velocidade e direção
define_movimento = function ()
{
	//Direção aleatória
	direction = irandom(359);

	//Velocidade aleatoria entre 0 e 2
	speed = random(vel_max);

	//Fazendo ele olhar para direção que ele vai
	image_angle = direction;

}


