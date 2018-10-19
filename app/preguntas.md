Con este comando nos ha permitido mastrar todos los archivos pesados
> `git rev-list --objects --all ` 

Se ha filtrado el archivo pesado que se proponia eliminar de los objetos de git
> `git filter-branch --index-filter 'git rm --cached --ignore-unmatch sc.16.tar.gz' -- --all`

Eliminar la carpeta refs original que se generó
> `rm -Rf .git/refs/original`

Eliminar la carpeta logs que se generó
> `rm -Rf .git/logs/`

Ejecutamos el comando para empaquetar y reconstruir los objetos segun los cambios actuales con el --prune=now
> `git gc --aggressive --prune=now`


1. ¿Qué importancia tiene los tags en un proyecto?
    > `Tiene mucha importancia ya que nos permite crear muchas versiones de nuestro proyecto con la finalidad de poder movernos entre cada uno de estos.`  

2. ¿Cuál es la diferencia entre un tag normal y un tag anotado en git?
    > `En  un tag normal podemos especificar el numero de la version y un tag anotado nos permite agregar un cuerpo a la version mediante el flag -a.`

3. ¿Cómo se sube todos los tags de git que hay en mi local?
    > `añadiendo el flag --tags al realizar un git push`

4. ¿Es necesario loguearse cada vez que subo una imagen a dockerhub?
    > `No, solo se logea una vez`

5. ¿Qué es y para qué sirve docker?
    > `Es una plataforma para crear contenedores y sirve para poder crear aplicaciones isoladas.`

6. ¿Cuál es la diferencia entre docker y VirtualBox (virtualización)?
    > `Docker crea una aplicacion (docker machine) que se conecta directamente al Kernel y VirtualBox crea una capa llamada HyperVisor y es ahi donde se ejecutan nuestras aplicaciones.`  

7. ¿Es necesario depender de una imagen de docker base al crear una imagen nueva?
    > `No, no es necesariamente, uno mismo puede crear su propia imagen.`

8. ¿Porqué debo anteponer el nombre de usuario en una imagen docker nueva?
    > `Para al momento de pushear poder reconocer el usuario de DockerHub`

9. ¿Que pasa si creo una imagen sin especificar una versión o tag, con qué versión se crea?
    > `Se crea el tag "latest" por defecto.`
    
    
 
- ¿Porqué es necesario crear un contenedor con esta bandera -it ? ¿Qué pasa si no le pongo -it?
    > `Para poder iniciar el contenedor de forma interactiva y activa la consola TTY del contenedor. Sin -it se levanta el contendor sin acceder de forma interactiva`
- ¿Para qué sirve ejecutar el comando bash al ejecutar una imagen?
    > `Para que al momento de levantar el contenedor acceda de modo interactivo al contenedor mediante la terminal.`

 
- ¿Cuál es la diferencia entre docker ps y docker ps -a?
    > `docker ps nos lista los contenedores ejecutandos y docker ps -a nos lista todos los contenedores prendidos y apagados.`


Listar archivos del contenedor

    `docker run marlonric/orbis-training-docker:0.2.0 ls`

Mostrar el contenido del archivo en el contenedor

    `docker run marlonric/orbis-training-docker:0.2.0 cat preguntas.md` 

---

1. ¿Cuál es la diferencia entre una imagen y un contenedor?
    > `Imagen es la base para levantar uno o muchos contenedor`
2. ¿Cómo listo las imágenes que hay en mi computadora?
    > `Con el comando docker images`
3. ¿Cómo salgo de un contenedor de docker?
    > `Con el comando exit`
4. ¿Se elimina el contenedor al salir de ella?
    > `No se elimina, se apaga el contenedor`
5. ¿Cómo elimino un contenedor?
    > `Con el comando docker rm mas el id del contenedor o el nombre`
6. ¿Para qué es necesario el flag `-i`, `-t`, `--rm`?
    > `-i: Para activar de forma interactiva`
    <br> `-t: Activa la consola TTY del contenedor`
    <br> `-rm: Para eliminar automaticamente el contenedor en caso exista`
7. ¿Cómo verifico que el archivo creado se encuentra en la imagen?
    > `Con docker run {name_image} cat name_file`
8. ¿Cómo se comenta una linea de código en Dockerfile?
    > `Con el simbolo almohadilla #`
    
---
Exponiendo puerto 80 a través del puerto 1080
    
    docker run -d -p 1080:80 marlonric/orbis-training-docker:1.0.0

---
    
1. ¿Qué es NGINX?
    > `Es un servidor web`
2. ¿Cómo expongo puertos en docker?
    > `EXPOSE`
3. ¿Cómo especifico los puertos al levantar un contenedor (docker run)?
gst    > `con la separacion de dos puntos ":", el primer puerto hace referencia al puerto del host y el segundo puerto hace referencia al contenedor`
4. ¿Cómo hago 'forward' al levantar un contenedor (docker run)?
    > `con el flag -p "8080:80"`

---
Ejercicio Linux, Makefile, Jenkins

1. ¿Qué significa el comando -d?
    > `Busca el directorio`
2. ¿Porqué la sentencia comienza con @?
    > `Para no mostrar la salida`
3. ¿Para qué sirve el comando mkdir?
    > `Crea un directorio`
4. Explicar lo que hace la función mkdir_deploy_dir
    > `Verifica si existe una carpeta de cierto nombre y si no existe la crea`
5. ¿Para qué sirve el uso de \?
    > `Permite escribir codigo a la otra linea para el comando`
6. ¿Para qué sirve el uso de &&?
    >   `Ejecuta el siguiente comando sólo si el anterior tuvo éxito`
7. ¿Qué función cumple usar los argumentos -rf?
    >   `Eliminar todos los archivos y directorios sin tener que confirmar`
8. Explicar lo que hace la función git_init (linea por linea)

    ```javascript
        define git_init //nombre de funcion
            @cd $(GIT_BRANCH_DIR) && \ // entra a la carpeta resultante de GIT_BRANCH_DIR
            rm -rf $(GIT_BRANCH_DIR)/.git && \ // Elimina el .git de la carpeta resultante de GIT_BRANCH_DIR
            git init //Inicializa git
        endef// final de la definicion de la funcion
    ```

9. ¿Para qué sirve el uso de eval?
    >   `permite definir una variable temporal`
10. ¿Para qué sirve el uso de shell?
    >   `Para hacer uso del hardware del SO`
11. ¿Para qué sirve el uso de git log --pretty=format:"%an"?
    >   `Trae el nombre de los autores de los commits`
12. ¿Cuál es la diferencia en usar git config y git config --global?
    >   `git config nos permite obtener y establecer variables de configuración y git config --global git config lee y escribe en ~/.gitconfig`
13. Explicar lo que hace la función git_config (línea por línea)

    ```javascript
        define git_config //nombre de la funcion
            $(eval GIT_USER_NAME := $(shell git log --pretty=format:"%an" | head -n 1)) // se almacena en una variable temporal el nombre del ultimo autor del commit
            $(eval GIT_USER_EMAIL := $(shell git log --pretty=format:"%ae" | head -n 1)) // se almacena en una variable temporal el correo del ultimo autor del commit
            @cd $(GIT_BRANCH_DIR) && \ //entra a la carpeta de nombre de la variable
            git config user.email "$(GIT_USER_EMAIL)" && \ // se define el nombre del autor de los commits
            git config user.name "$(GIT_USER_NAME)"//se define el correo del autor de los commits
        endef //fin de la funcion
    ```
14. ¿Para qué sirve el uso de awk?
    > `Nos ayudar a leer y procesar texto`
15. ¿Para qué sirve el uso de sed?
    > `funciona bien con el procesamiento basado en caracteres`
16. ¿Para qué sirve el uso de git log --pretty=format:"%an"?
    > `trae el nombre de los autores de los commits`
17. Explicar lo que hace la función git_add_remote_repository
    ```javascript
        define git_add_remote_repository //nombre de funcion
            $(eval REPOSITORY := $(shell git remote -v | grep origin | grep '(push)'| awk '{print $$2}')) //se almacena nombre del repositorio
            $(eval GIT_REPOSITORY_REMOTE := $(shell echo $(REPOSITORY) | sed 's%https://%https://$(GIT_PERSONAL_TOKEN)@%g')) // se almacena nombre del repositorio remoto con el patron asignado en sed
            @cd $(GIT_BRANCH_DIR) && \ //se ubica en el directorio bajo el nombre de variable temporal
            git remote add origin $(GIT_REPOSITORY_REMOTE)// se agrega al repositorio en remoto
        endef // fin de la funcion
    ```
18. Explicar lo que hace la función create_branch_gh_pages
    > `Se ubica en una carpeta y crea una rama`
19. Explicar lo que hace la función copy_files_to_deploy
    >  `copia todos los archivos en el directorio deploy/build al directorio temporal`
20. Explicar lo que hace la función git_add
    >   `se ubica en el directorio de nombre del la variable temporal y agrega los cambios al stage`
21. Explicar lo que hace la función create_commit (línea por línea)
    ```javascript
        define create_commit//nombre de la funcion
            $(eval MESSAGE := $(shell git log --pretty=format:"%s" | head -n 1)) //se almacena el mensaje del ultimo commit
            @cd $(GIT_BRANCH_DIR) && \ //se ubica en la carpeta raiz
            git commit -m "$(MESSAGE)" //se hace el commit
        endef//final funcion
    ```
22. Explicar lo que hace la función git_push (línea por línea)
    ```javascript
        define git_push//nombre de la funcion
            @cd $(GIT_BRANCH_DIR) && \//se ubica en la carpeta raiz
            git push origin $(GIT_BRANCH) --force//se hace un push forzado
        endef//final de la funcion
    ```
23. Explicar lo que hace la función clean_workspace
    >   `Elimina la carpeta temporal`
24. ¿Para qué sirve el uso de ifeq?
    >   `Inicia la condicion para ejecutar lineas en el makefile`
25. ¿Para qué sirve el uso de strip?
    >   `Descartas símbolos de archivos objeto`
26. Explicar lo que hace la función show_deploy_url (línea por línea)
    ```javascript
        define show_deploy_url// nombre de la funcion
            $(eval GIT_REPOSITORY_REMOTE := $(shell git remote -v | grep origin | grep '(push)'| awk '{print $2}')) //se almacena nombre del repo remoto
            $(eval GIT_REPOSITORY_REMOTE_SSH := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | grep 'git@')) // by ssh

            $(ifeq ($(strip $(GIT_REPOSITORY_REMOTE_SSH)),), \//empieza condicional
                $(eval GIT_USER_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 1 | cut -d ":" -f 2)), \
                $(eval GIT_USER_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 4)) \
            )

            $(ifeq ($(strip $(GIT_REPOSITORY_REMOTE_SSH)),), \
                $(eval GIT_REPOSITORY_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 2)), \
                $(eval GIT_REPOSITORY_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 5 | sed "s/.git//g" | sed "s/(push)//g")) \
            )

            @echo ""
            @echo "Publicado en: http://$(GIT_USER_NAME).github.io/$(GIT_REPOSITORY_NAME)"
            @echo ""
        endef
    ```
27. 