/// @description Insert description here
// You can write your code in this editor



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


