/// @description Insert description here
// You can write your code in this editor

vida = 10;

timer_movimento = room_speed * random_range(5, 15);

//Inicia movimento
inicia_movimento = function()
{
	speed = random(2);
	direction = irandom(359);
	image_angle = direction;
}

inicia_movimento();

//Timer movimento
mudar_movimento = function()
{

	timer_movimento--;
	if(timer_movimento <= 0)
	{
		inicia_movimento();
		
		timer_movimento = random_range(5,15) * room_speed;
	}
	
}








