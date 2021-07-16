sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo rm -f /etc/gunicorn.d/*
sudo ln -sf /home/box/web/etc/hello.conf /etc/gunicorn.d/hello.conf
sudo ln -sf /home/box/web/etc/ask.conf /etc/gunicorn.d/ask.conf
sudo /etc/init.d/gunicorn restart

sudo rm -f /etc/mysql/conf.d/mysql.cnf
sudo /etc/init.d/mysql start
sudo mysql -u root -e "create database if not exists ask;"
sudo mysql -u root -e "grant all privileges on ask.* to 'box'@'localhost' with grant option;"
sudo ln -sf /home/box/web/etc/mysql.cnf /etc/mysql/conf.d/mysql.cnf
sudo /etc/init.d/mysql restart
python /home/box/web/ask/manage.py makemigrations qa
python /home/box/web/ask/manage.py migrate
