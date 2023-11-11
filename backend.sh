echo -e "\e[36m disable default vertion of nodjs \e[0m"

dnf module disable nodejs -y &>>/temp/expence.log
dnf module enable nodejs:18 -y &>>/temp/expence.log

echo -e "\e[36m install nodjs  \e[0m"
dnf install nodejs -y &>>/temp/expence.log
cp backend.service /etc/systemd/system/backend.service &>>/temp/expence.log

echo -e "\e[36m adding the user \e[0m"
useradd expense &>>/temp/expence.log
echo -e "\e[36m add app directory  \e[0m"
mkdir /app &>>/temp/expence.log
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>/temp/expence.log
cd /app
unzip /tmp/backend.zip
cd /app
npm install
dnf install mysql -y &>>/temp/expence.log
mysql -h mysql-dev.pavanbalubadi3017.online -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload &>>/temp/expence.log
systemctl enable backend &>>/temp/expence.log
systemctl start backend &>>/temp/expence.log
