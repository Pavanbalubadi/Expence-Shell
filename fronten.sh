logs_file=/expence.log
colour="\e[33m "
colour1="\e[0m"

echo -e "${colour} insatll nginx ${colour1}"
dnf install nginx -y  &>>logs_file
echo -e "${colour} copy expence.conf file ${colour1}"
cp expence.conf /etc/nginx/default.d/expense.conf &>>logs_file
echo -e "${colour}remove nginx old content ${colour1}"
rm -rf /usr/share/nginx/html/* &>>logs_file
echo -e "${colour} download frontend application ${colour1}"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip  &>>logs_file
echo -e "${colour} unzip nginx ${colour1}"
cd /usr/share/nginx/html  &>>logs_file
unzip /tmp/frontend.zip  &>>logs_file
echo -e "${colour} start the nginx ${colour1}"
systemctl enable nginx  &>>logs_file
systemctl start nginx  &>>logs_file

# hi


