echo -e "\e[36m disable default my sql \e[0m"

dnf module disable mysql -y &>>/temp/expence.log

echo -e "\e[36m coppying the mysql.repo file  \e[0m"

cp  mysql.repo /etc/yum.repos.d/mysql.repo &>>/temp/expence.log

echo -e "\e[36m install mysql server  \e[0m"

dnf install mysql-community-server -y &>>/temp/expence.log

echo -e "\e[36m start mysql  \e[0m"

systemctl enable mysqld &>>/temp/expence.log
systemctl start mysqld &>>/temp/expence.log

echo -e "\e[36m login to mysql \e[0m"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>/temp/expence.log
#mysql -h <mysql-dev.pavanbalubadi3017.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql