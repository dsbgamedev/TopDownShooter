//Criando o controlador SE ele ainda não existe
if(!instance_exists(obj_control))
{
	instance_create_layer(0,0,"Player", obj_control);	
}