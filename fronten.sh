echo -e "\e[36m insatll nginx \e[0m"
dnf install nginx -y
echo -e "\e[36m copy expence.conf file \e[0m"
cp expence.conf /etc/nginx/default.d/expense.conf
echo -e "\e[36m remove nginx old content \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[36m download frontend application \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[36m unzip nginx \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[36m start the nginx \e[0m"
systemctl enable nginx
systemctl start nginx

# hi


