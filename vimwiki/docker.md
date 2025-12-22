docker images

##to load:
docker load -i filename.tar

##to unload:
docker rmi <Name or imageId>
#Если у вас несколько тегов одного образа, Docker может предупредить,
#что образ используется. В таком случае можно принудительно удалить с флагом -f
docker rmi -f <Name or imageId>
#сохранить образ в файл и удалить
docker save <imageName> -o backup.tar && docker rmi <imageName>

#сохранить образ в файл и удалить
docker save <imageName> -o backup.tar && docker rmi <imageName>

##run via docker-compose.yml
docker compose -f docker-compose.yml down/up -d

##sshfs
sshfs vl@192.168.10.108:/home/vl /home/user/shr

##file permissions: deny even for root
# Заблокировать:
sudo chattr +i /путь/к/файлу

# Разблокировать:
sudo chattr -i /путь/к/файлу
