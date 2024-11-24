#Creamos el Dockerfile.
touch Dockerfile
vim Dockerfile
#Dentro del dockerfile ponemos lo siguiente:
	FROM nginx

	COPY appHomeBanking /usr/share/nginx/html
#Luego creamos el directorio appHomeBanking y entramos.
mkdir appHomeBanking
cd appHomeBanking/
#Creamos index.html y contacto.html y le ponemos un html basico.
touch index.html contacto.html
vim index.html 
vim contacto.html
#Volvemos a la ruta donde estaba el Dockerfile.
cd ..
#Nos logueamos con docker.
docker login -u agussnb
#Hacemos la imagen.
docker build -t agussnb/2parcial-ayso:v1.0 .
#La pusheamos al repositorio de docker.
docker push agussnb/2parcial-ayso:v1.0
#Desplegamos la imagen.
docker run -d -p 8080:80 agussnb/2parcial-ayso:v1.0

