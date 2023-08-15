/// @description Insert description here
// You can write your code in this editor

//Váriaveis do time de movimento
timer_movimento = room_speed * random_range(4,10);

//Distancia para ele seguir o player
distancia  = 200;

//Variavel de vida
vida = 3;


//Metodo para definir velocidade e direção
define_movimento = function ()
{
	//Direção aleatória
	direction = irandom(359);

	//Velocidade aleatoria entre 0 e 2
	speed = random(2);

	//Fazendo ele olhar para direção que ele vai
	image_angle = direction;
	
}

define_movimento();

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

//Metodo meu timer para mudar de movimento 
mudar_movimento = function()
{
	//Diminuir o timer
	timer_movimento--;
	
	if(timer_movimento <= 0)
	{
		define_movimento();
		
		//Resetando o timer
		timer_movimento = room_speed * random_range(4,10);
	}
	
}

//Método inimigo persegue o player se estiver proximo
seguir_player = function()
{
	//Checando a minha distancia para o player	
	//Checando se o Player existe
	if(instance_exists(obj_player))
	{
		//Pegando a distancia
		var _dist_player = point_distance(x,y,obj_player.x,obj_player.y);
		
		//Seguindo o player SE ele estiver muito proximo
		if(_dist_player < distancia)
		{
			//Pegando a direção do Player
			var _dir = point_direction(x,y,obj_player.x,obj_player.y);
			direction = _dir;
			//usando uma velocidade padrão
			speed = 1;
		}
	}
	
	
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
	}
		
}

//Metodo explodir o inimigo
explodir = function()
{
	//Criando um numero aleatorio de pedaços
	var _qtd = irandom_range(5,10);
	
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