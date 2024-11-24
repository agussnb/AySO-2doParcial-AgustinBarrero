#En la vm 10.0.2.15
sudo su root
dnf install ansible -y
ansible-version
ssh-keygen
ssh-copy-id liveuser@10.0.2.4
touch inventory

vim inventory
# Dentro del vim inventory:

[desarrollo]
10.0.2.4 ansible_user=liveuser

ansible -i inventory desarrollo -m ping

touch apache-playbook.yml

vim apache-playbook.yml
# Dentro del archivo apache-playbook.yml

- name: Configurar el host Desarrollo
  hosts: desarrollo
  tasks:
    - name: Actualizar todos los paquetes
      ansible.builtin.yum:
        name: '*'
        state: latest
    - name: Instalar apache
      ansible.builtin.yum:
        name: httpd
        state: present
    - name: Iniciar y habilitar apache
      ansible.builtin.systemd:
        name: httpd
        state: started
        enabled: true

# Guardamos y salimos: wq
# Finalmente

ansible-playbook -i inventory apache-playbook.yml

#En la vm 10.0.2.4
rpm -q httpd # Para verificar que apache se instalo
systemctl status httpd # Para verificar que apache este en ejecucion
http://10.0.2.15
