-- Variables globales

c1=undefined
linea=undefined
linea2=undefined
carretera = undefined
divisoria=undefined
barrera=undefined
barandillaBarrera1=undefined
barandillaBarrera2=undefined
pilarini1=undefined
pilarini2=undefined
pilarfini1=undefined
pilarfini2=undefined
anchCarretera= 100
altCarretera = 30
largCarretera=2500
matCarretera = undefined
colorPuente=[225,2,2]
colorCuerda=[255,255,255]
centroX=0
centroY=0
centroZ=0
carreteraCreada=false
barreraCreada=false
traficoCreado=false
numBarreras=30
barrera1 = #()
barrera2=#()
pilar=#()
pilar2=#()
coche1=#()
coche2=#()
colgante1=#()
colgante2=#()
distanciaBarrera=0
distanciaColgante=0
distancia=0
distancia2=0
tipoTrafico = "Ida y vuelta"
numPilares=2
pilarCreado=false
distanciaPilar=0
distancia3=0
distancia4=0
distancia5=0
distancia6=0
distancia7=0
distancia8=0
distanciaTrafico=0
distanciaTrafico2=0
numCoches=20
numCochesv=20
lineaCreada=false
numColgante=100
anchPilar=40
aux=#()



--funciones

fn borradoCarretera num = (

	delete carretera
	delete divisoria
	carreteraCreada = false
	

)
fn borradoBarrera num =(
	
	for i in 1 to barrera1.count do(
		delete barrera1[i]
	)
	for i in 1 to barrera2.count do(
		delete barrera2[i]
	)
	barrera1=#()
	barrera2=#()
	delete barandillaBarrera1
	delete barandillaBarrera2
	barreraCreada=false
	distancia=0
	distancia2=0
)
fn borradoPilar num=(
	
	for i in 1 to pilar.count do(
		delete pilar[i]
	)
	for i in 1 to pilar2.count do(
		delete pilar2[i]
	)
	for i in 1 to aux.count do(
		delete aux[i]
	)
	aux=#()
	pilar=#()
	pilar2=#()
	pilarCreado=false
	delete pilarini1
	delete pilarini2
	delete pilarfini1
	delete pilarfini2
	
	distancia3=0
	distancia4=0
	if(lineaCreada==true)then(
		delete linea
		delete linea2
		lineaCreada=false
		for i in 1 to colgante1.count do(
			delete colgante1[i]
		)
		for i in 1 to colgante2.count do(
			delete colgante2[i]
		)
		colgante1=#()
		colgante2=#()
		distancia7=0
		distancia8=0
	)
)
fn borradoTrafico num=(
	
	for i in 1 to coche1.count do(
		delete coche1[i]
	)
	for i in 1 to coche2.count do(
		delete coche2[i]
	)
	coche1=#()
	coche2=#()
	traficoCreado=false
	distancia5=0
	distancia6=0
)
fn borradoLinea num=(
	
	delete linea
	delete linea2
	lineaCreada=false
	for i in 1 to colgante1.count do(
		delete colgante1[i]
	)
	for i in 1 to colgante2.count do(
			delete colgante2[i]
	)
	colgante1=#()
	colgante2=#()
	distancia7=0
	distancia8=0
)
-- funcion para crear la carretera
fn crearCarretera largo ancho alto x y z = (
	
	carretera = Box lengthsegs:1 widthsegs:1 heightsegs:1 length:largo width:(ancho+50) height:alto mapcoords:on pos:[x,y,z] isSelected:on
	divisoria = Box lengthsegs:1 widthsegs:1 heightsegs:1 length:largo width:3 height:0.5 mapcoords:on pos:[x,y,z+alto] isSelected:on
	divisoria.wirecolor=white;
	carretera.wirecolor=colorPuente
	if matCarretera!= undefined then(
		carretera.material = matCarretera
	)
	else(
		carretera.material = default
	)
	
)
--funcion`para crear la barrera
fn crearBarrera largo ancho alto x y z=(
	distanciaBarrera=(largo-(numBarreras*9.1385))/(numBarreras+1)
	for i =1 to numBarreras do(
		barrera1[i]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:9.1385 width:10.7324 height:26.3804 mapcoords:on pos:[x+(ancho/2)-(10.7324/2),(y-(largo/2)+distanciaBarrera)+distancia,z+alto] 
		distancia=distancia+distanciaBarrera+9.1385
		barrera1[i].wirecolor=colorPuente
		if matCarretera!= undefined then(
			barrera1[i].material = matCarretera
			
		)
		else(
			barrera1[i].material = default
		)
	)
	for i =1 to numBarreras do(
		barrera2[i]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:9.1385 width:10.7324 height:26.3804 mapcoords:on pos:[x-(ancho/2)+(10.7324/2),(y-(largo/2)+distanciaBarrera)+distancia2,z+alto] 
		distancia2=distancia2+distanciaBarrera+9.1385
		barrera2[i].wirecolor=colorPuente
		if matCarretera!= undefined then(
			barrera2[i].material = matCarretera
			
		)
		else(
			barrera2[i].material = default
		)
	)
	barandillaBarrera1=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:largo width:10.7324 height:12 mapcoords:on pos:[x+(ancho/2)-(9.1385/2),y,z+alto+26.3804] 
	barandillaBarrera2=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:largo width:10.7324 height:12 mapcoords:on pos:[x-(ancho/2)+(9.1385/2),y,z+alto+26.3804] 
	barandillaBarrera1.wirecolor=colorPuente
	barandillaBarrera2.wirecolor=colorPuente
	if matCarretera!= undefined then(
		barandillaBarrera1.material = matCarretera
		barandillaBarrera2.material = matCarretera
	)
	else(
		barandillaBarrera1.material = default
		barandillaBarrera2.material = default
	)
)
--funcion para crear los pilares
fn crearPilar largo ancho alto x y z=(
		distanciaPilar=(largo-(numPilares*30))/(numPilares+1)
		pilarini1=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x+(ancho/2)+(40/2),(y-(largo/2)+15),z-250] 
		pilarini2=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x-(ancho/2)-(40/2),(y-(largo/2)+15),z-250]
		pilarfini1=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x+(ancho/2)+(40/2),(y+(largo/2)-15),z-250]
		pilarfini2=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x-(ancho/2)-(40/2),(y+(largo/2)-15),z-250]
		pilarini1.wirecolor=colorPuente
		pilarini2.wirecolor=colorPuente
		pilarfini1.wirecolor=colorPuente
		pilarfini2.wirecolor=colorPuente
		aux[1]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+15),z-100] 
		aux[2]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+15),z+130] 
		aux[3]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+15),z+280]
		aux[4]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+15),z+430] 
		aux[5]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+15),z+580] 
		aux[6]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y+(largo/2)-15),z-100] 
		aux[7]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y+(largo/2)-15),z+130] 
		aux[8]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y+(largo/2)-15),z+280]
		aux[9]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y+(largo/2)-15),z+430] 
		aux[10]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y+(largo/2)-15),z+580] 	
	

		if matCarretera!= undefined then(
					pilarini1.material=matCarretera
					pilarini2.material=matCarretera
					pilarfini1.material=matCarretera
					pilarfini2.material=matCarretera
					
		)
		else(
					pilarini1.material=default
					pilarini2.material=default
					pilarfini1.material=default
					pilarfini2.material=default
				
		)			
				
		for i =1 to numPilares do(
			pilar[i]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x+(ancho/2)+(40/2),(y-(largo/2)+distanciaPilar)+distancia3,z-250] 
			pilar[i].wirecolor=colorPuente
			if(i==1)then(
					aux[11]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z-100] 
					aux[12]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+130] 
					aux[13]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+280]
					aux[14]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+430] 
					aux[15]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+580] 

				
				
					
			)
				if(i==2)then(
					aux[16]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z-100] 
					aux[17]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+130] 
					aux[18]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+280]
					aux[19]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+430] 
					aux[20]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+580] 
					
					
			)
				if(i==3)then(
					aux[21]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z-100] 
					aux[22]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+130] 
					aux[23]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+280]
					aux[24]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+430] 
					aux[25]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+580] 
					
			)
				if(i==4)then(
					aux[26]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z-100] 
					aux[27]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+130] 
					aux[28]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+280]
					aux[29]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+430] 
					aux[30]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:20 width:ancho height:anchPilar mapcoords:on pos:[x,(y-(largo/2)+distanciaPilar)+distancia3,z+580] 
					
			)
			distancia3=distancia3+distanciaPilar+30
			if matCarretera!= undefined then(
				pilar[i].material = matCarretera
			)
			else(
				pilar[i].material = default
			)
		)
		for i =1 to numPilares do(
			pilar2[i]=Box lengthsegs:1 widthsegs:1 heightsegs:1 length:30 width:40 height:900 mapcoords:on pos:[x-(ancho/2)-(40/2),(y-(largo/2)+distanciaPilar)+distancia4,z-250] 
			distancia4=distancia4+distanciaPilar+30
			pilar2[i].wirecolor=colorPuente
			if matCarretera!= undefined then(
				pilar2[i].material = matCarretera
			)
			else(
				pilar2[i].material = default
			)
		)
		for i=1 to aux.count do(
			aux[i].wirecolor=colorPuente
			if matCarretera!= undefined then(
				aux[i].material = matCarretera
			)
			else(
				aux[i].material = default
			)
		)
		
)
--funcion para crear el trafico
fn crearTrafico largo ancho alto x y z=(
	distanciaTrafico=(largo-(numCoches*20))/(numCoches+1)
	distanciaTrafico2=(largo-(numCochesV*20))/(numCochesV+1)
	if(tipoTrafico == "Ida y vuelta") then(
		for i =1 to numCoches do(
			coche1[i]=Sphere radius:76.7226 smooth:on segs:32 chop:0 slice:off sliceFrom:0 sliceTo:0 mapcoords:on recenter:off pos:[2233.35,234.18,0] isSelected:on
			scale coche1[i] [1,1,0.704194]
			scale coche1[i] [1,0.890747,1]
			scale coche1[i] [0.844719,0.844719,0.844719]
			scale coche1[i] [0.597514,1,1]
			scale coche1[i] [1,1,0.887318]
			scale coche1[i] [0.296703,0.296703,0.296703]
			coche1[i].position = [x+(ancho/4),(y-(largo/2)+distanciaTrafico)+distancia5,z+alto+10] 
			distancia5=distancia5+distanciaTrafico+22
			coche1[i].wirecolor=(color(random 10 230)(random 10 230)(random 10 230))
		)
		for i =1 to numCochesV do(
			coche2[i]=Sphere radius:76.7226 smooth:on segs:32 chop:0 slice:off sliceFrom:0 sliceTo:0 mapcoords:on recenter:off pos:[2233.35,234.18,0] isSelected:on
			scale coche2[i] [1,1,0.704194]
			scale coche2[i] [1,0.890747,1]
			scale coche2[i] [0.844719,0.844719,0.844719]
			scale coche2[i] [0.597514,1,1]
			scale coche2[i] [1,1,0.887318]
			scale coche2[i] [0.296703,0.296703,0.296703]
			coche2[i].position = [x-(ancho/4),(y-(largo/2)+distanciaTrafico2)+distancia6,z+alto+10] 
			distancia6=distancia6+distanciaTrafico2+22
			coche2[i].wirecolor=(color(random 10 230)(random 10 230)(random 10 230))
		)
		
	)
	if(tipoTrafico == "Ida") then(
		for i =1 to numCoches do(
			coche1[i]=Sphere radius:76.7226 smooth:on segs:32 chop:0 slice:off sliceFrom:0 sliceTo:0 mapcoords:on recenter:off pos:[2233.35,234.18,0] isSelected:on
			scale coche1[i] [1,1,0.704194]
			scale coche1[i] [1,0.890747,1]
			scale coche1[i] [0.844719,0.844719,0.844719]
			scale coche1[i] [0.597514,1,1]
			scale coche1[i] [1,1,0.887318]
			scale coche1[i] [0.296703,0.296703,0.296703]
			coche1[i].position = [x+(ancho/4),(y-(largo/2)+distanciaTrafico)+distancia5,z+alto+10] 
			distancia5=distancia5+distanciaTrafico+22
			coche1[i].wirecolor=(color(random 10 230)(random 10 230)(random 10 230))
		)
	)
	if(tipoTrafico == "Vuelta") then(
		for i =1 to numCochesV do(
			coche2[i]=Sphere radius:76.7226 smooth:on segs:32 chop:0 slice:off sliceFrom:0 sliceTo:0 mapcoords:on recenter:off pos:[2233.35,234.18,0] isSelected:on
			scale coche2[i] [1,1,0.704194]
			scale coche2[i] [1,0.890747,1]
			scale coche2[i] [0.844719,0.844719,0.844719]
			scale coche2[i] [0.597514,1,1]
			scale coche2[i] [1,1,0.887318]
			scale coche2[i] [0.296703,0.296703,0.296703]
			coche2[i].position = [x-(ancho/4),(y-(largo/2)+distanciaTrafico2)+distancia6,z+alto+10] 
			distancia6=distancia6+distanciaTrafico2+22
			coche2[i].wirecolor=(color(random 10 230)(random 10 230)(random 10 230))
		)
	)
)
--funcion para crear las lineas
fn crearLinea  largo ancho alto x y z=(
	if(pilarCreado==true) then(
		distanciaColgante=(largo-(numColgante*1))/(numColgante+1)
		linea=Cylinder smooth:on heightsegs:5 capsegs:1 sides:18 height:(largo-5) radius:3 mapcoords:on pos:[x-(ancho/2)-(40/2),y+(largo/2),z+600+alto] isSelected:on
		rotate linea (angleaxis 90 [1,0,0])
			linea.wirecolor=colorCuerda
		linea2=Cylinder smooth:on heightsegs:5 capsegs:1 sides:18 height:(largo-5) radius:3 mapcoords:on pos:[x+(ancho/2)+(40/2),y+(largo/2),z+600+alto] isSelected:on
		rotate linea2 (angleaxis 90 [1,0,0])
			linea2.wirecolor=colorCuerda
		for i =1 to numColgante do(
			colgante1[i]=Cylinder smooth:on heightsegs:5 capsegs:1 sides:18 height:600 radius:1 mapcoords:on pos:[x+(ancho/2)+(40/2),(y-(largo/2)+distanciaColgante)+distancia7,z+alto] 
			distancia7=distancia7+distanciaColgante+2
			colgante1[i].wirecolor=colorCuerda
		)
		for i =1 to numColgante do(
			colgante2[i]=Cylinder smooth:on heightsegs:5 capsegs:1 sides:18 height:600 radius:1 mapcoords:on pos:[x-(ancho/2)-(40/2),(y-(largo/2)+distanciaColgante)+distancia8,z+alto] 
			distancia8=distancia8+distanciaColgante+2
			colgante2[i].wirecolor=colorCuerda
		)
		
	)
)


-- RollOuts
try (destroyDialog herramientaPuente) catch()

rollout herramientaPuente "Creación de Puente"(
	Subrollout subrolloutGeneral height:700 width:320
	
	on herramientaPuente close do(
		
		if(queryBox "¿Deseas conservar el puente?" title:"Guardar puente") == false then
			(
					borrar 1
			)
	)
	
)

Rollout Menu01 "General"
(
	label posicionC "Posición del Puente" pos:[98,8] width:98 height:15

	spinner posicionCX "X: " pos:[24,32] width:64 height:16 range:[-100,100,centroX] 

	spinner posicionCY "Y: " pos:[112,32] width:64 height:16 range:[-100,100,centroY] 

	spinner posicionCZ "Z: " pos:[208,32] width:64 height:16 range:[-100,100,centroZ] 
	
	spinner largoCarretera "Largo carretera:" range:[2000,4000,2500] type:#integer tooltip:"Elige el largo que tendrá la carretera"
	
	spinner anchoCarretera "Ancho carretera:" range:[100,200,100] type:#integer tooltip:"Elige el ancho que tendrá la carretera"
	
	spinner altoCarretera "Altura carretera:" range:[10,50,30] type:#integer tooltip:"Elige la altura que tendrá la carretera"
	
	checkbox checkFormaBarrera "Colocar Barreras" pos:[72,120] width:142 height:18 checked:true
	
	spinner numeroBarreras "Numero soportes barrera:" range:[10,50,30] type:#integer tooltip:"Elige la cantidad de soportes de la barrera"
	
	on largoCarretera changed escala do
	(
		largCarretera=largoCarretera.value
	)
	
	on anchoCarretera changed escala do
	(
		anchCarretera=anchoCarretera.value
	)
	on altoCarretera changed escala do
	(
		altCarretera=altoCarretera.value
	)
	on posicionCX changed param do(
		centroX = posicionCX.value
	)
	on posicionCY changed param do(
		centroY = posicionCY.value
	)
	on posicionCZ changed param do(
		centroZ = posicionCZ.value
	)
	materialbutton materialCarretera "Seleccionar material"
	on materialCarretera picked mat do(
			matCarretera = mat
	)
	label lblo "ó" 
	colorPicker newColorPuente "Color: "  pos:[100,210] title:"Elige un Color" color: [225, 2, 2]

	button verCarretera "Crear Carretera"
	button verBarrera "Crear Barrera"
	
	
	on verCarretera pressed do(
		if(carreteraCreada==false) then (
			crearCarretera largCarretera anchcarretera altCarretera  centroX centroY centroZ
			carreteraCreada=true
		)
		else if(carreteraCreada==true) then(
			borradoCarretera 1
		)
	)
	on verBarrera pressed do(
		if(barreraCreada==false) then (
			crearBarrera largCarretera anchcarretera altCarretera  centroX centroY centroZ
			barreraCreada=true
		)
		else if(barreraCreada==true) then(
			borradoBarrera 1
		)
	)
	on  newColorPuente changed new_col do
	(
		colorPuente= new_col
	
	)
	
	on checkFormaBarrera changed theState do
	(
		if checkFormaBarrera.checked then(
			
			numeroBarreras.enabled=true
			verBarrera.enabled=true
		)

		else(
				
			numeroBarreras.enabled=false
			verBarrera.enabled=false
		)
	)
	
	on numeroBarreras changed param do(
		numBarreras=numeroBarreras.value
	)
	

)
Rollout Menu02 "Pilares"
(
	
	spinner numeroPilares "Numero Pilares interiores:" range:[1,4,2] type:#integer tooltip:"Elige el numero de pilares"
	
	spinner anchoPilares "Ancho de los pilares interiores:" range:[10,60,40] type:#integer tooltip:"Elige el numero de pilares"

	button verPilares "Crear Pilares"
	
	spinner numeroColgante "Numero de cuerdas colgantes:" range:[50,100,100] type:#integer tooltip:"Elige el numero de cuerdas colgantes"

	colorPicker newColorCuerda "Color: "  pos:[100,100] title:"Elige un Color" color: [255, 255, 255]
	
	button verLineas"Crear Cuerdas"
	
	on numeroPilares changed param do(
		numPilares = numeroPilares.value
	)
	on verPilares pressed do(
		if(pilarCreado==false) then (
			crearPilar largCarretera anchcarretera altCarretera  centroX centroY centroZ
			pilarCreado=true
		)
		else if(pilarCreado==true) then(
			borradoPilar 1
		)
	)
	on verLineas pressed do(
		if(lineaCreada==false and pilarCreado==true) then (
			crearLinea largCarretera anchcarretera altCarretera  centroX centroY centroZ
			lineaCreada=true
		)
		else if(lineaCreada==true) then(
			borradoLinea 1
		)
	)
	on numeroColgante changed escala do
	(
		numColgante=numeroColgante.value
	)
	on anchoPilares changed escala do
	(
		anchPilar=anchoPilares.value
	)
	on  newColorCuerda changed new_col do
	(
		colorCuerda= new_col
		
	
	)
	
	
)
Rollout Menu03 "Trafico"
(
	dropdownlist formaTrafico "Tipo de trafico" items:#("Ida y Vuelta","Ida","Vuelta") tooltip:"Selecciona el tipo de trafico"
	spinner numeroCochesI "Numero de coches Ida:" range:[5,30,20] type:#integer tooltip:"Elige el numero de ciches de Ida"
	spinner numeroCochesV "Numero de coches Vuelta:" range:[5,30,20] type:#integer tooltip:"Elige el numero de ciches de Vuelta"
	button verTrafico "Crear Trafico"
	on formaTrafico selected formaElegida do
	(
		case formaElegida of
			(
				
				1: tipoTrafico = "Ida y vuelta"
				2: tipoTrafico = "Ida"
				3: tipoTrafico = "Vuelta"
				default: tipoTrafico = "Ida y veulta"
			
		
		)
		if(tipoTrafico=="Ida")then(
				numeroCochesV.enabled=false
				numeroCochesI.enabled=true
		)
		if(tipoTrafico=="Vuelta")then(
				numeroCochesV.enabled=true
				numeroCochesI.enabled=false

		)
		if(tipoTrafico=="Ida y vuelta")then(
				numeroCochesV.enabled=true
				numeroCochesI.enabled=true

		)
		
	)
	
	on verTrafico pressed do(
		if(traficoCreado==false) then (
			crearTrafico largCarretera anchcarretera altCarretera  centroX centroY centroZ
			traficoCreado=true
		)
		else if(traficoCreado==true) then(
			borradoTrafico 1
		)
	)
	on numeroCochesI changed param do(
		numCoches = numeroCochesI.value
	)
	on numeroCochesV changed param do(
		numCochesV = numeroCochesV.value
	)
	
	
	
	
)

createDialog herramientaPuente 340 650
AddSubRollout herramientaPuente.subrolloutGeneral Menu01
AddSubRollout herramientaPuente.subrolloutGeneral Menu02
AddSubRollout herramientaPuente.subrolloutGeneral Menu03
