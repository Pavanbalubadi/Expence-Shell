echo -e "\e[36m disable default vertion of nodjs \e[0m"

dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo -e "\e[36m install nodjs  \e[0m"
dnf install nodejs -y
cp backend.service /etc/systemd/system/backend.service

echo -e "\e[36m adding the user \e[0m"
useradd expense
echo -e "\e[36m add app directory  \e[0m"
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install
dnf install mysql -y
mysql -h <mysql-dev.pavanbalubadi3017.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend
systemctl start backend
