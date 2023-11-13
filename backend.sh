echo -e "\e[36m disable default vertion of nodjs \e[0m"

dnf module disable nodejs -y  &>>/expence.log
echo $?
dnf module enable nodejs:18 -y &>>/expence.log
echo $?
echo -e "\e[36m install nodjs  \e[0m"
dnf install nodejs -y  &>>/expence.log
echo $?
cp backend.service /etc/systemd/system/backend.service &>>/expence.log
echo $?
echo -e "\e[36m adding the user \e[0m"
useradd expense  &>>/expence.log
echo $?
echo -e "\e[36m add app directory  \e[0m"
mkdir /app &>>/temp/expence.log
echo $?
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip  &>>/expence.loge.log
echo $?
cd /app
echo $?
unzip /tmp/backend.zip
echo $?
cd /app
npm install
echo $?
dnf install mysql -y  &>>/expence.log
echo $?
mysql -h mysql-dev.pavanbalubadi3017.online -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload  &>>/expence.log
systemctl enable backend  &>>/expence.log
systemctl start backend  &>>/expence.log