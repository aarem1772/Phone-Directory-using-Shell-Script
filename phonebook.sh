#!/bin/bash
clear
phone()
{
while :
do
clear
echo "Welcome to THE PHONEBOOK"
echo "1. ADD CONTACT"
echo "2. SEARCH CONTACT"
echo "3. DELETE CONTACT"
echo "4. EDIT CONTACT"
echo "5. VIEW PHONEBOOK"
echo "6. LOG OUT"
read -p "enter your choice: " choice
clear
case $choice in
1) echo -e "\n-----------------------------------ADD CONTACT--------------------------------\n\n"
   read -p "Enter Name :  " name
   read -p "Enter mobile number 1 :  " number1
   read -p "Enter mobile number 2 : " number2
   read -p "Enter email id : " email
   read -p "Enter address : " address
   echo -e "$name\t$email\t$number1\t$number2\t$address\n" >> $user_name.csv
   echo -e "\n Contact saved successfuly!"
   ;;
2) echo -e "\n-----------------------------------SEARCH CONTACT------------------------------\n\n"
   read -p "Enter contact name to search or number to search : " search_name
   clear
   echo -e "\n Search Results: "
   if
   grep -i $search_name "$user_name.csv"
   then
   echo -e "  "
   else
   echo -e " no such contact "
   fi
   ;;
3) echo -e "\n-----------------------------------DELETE CONTACT------------------------------\n\n"
   read -p "Enter contact name to delete or number to delete : " delete_name
   if
   grep -i $delete_name "$user_name.csv"
   then 
   sed -i -e "/$delete_name/d" $user_name.csv
   echo -e "\n\n Contact deleted succesfully!!"
   else
   echo -e "\n\nContact not found!!"
   fi
   ;;
4) echo -e "\n----------------------------------EDIT CONTACT------------------------------\n\n"
   read -p "Enter name or cotact no. : " edit_name
   if
   grep -i $edit_name "$user_name.csv"
   then
   echo -e "\n\n"
   echo "Welcome to Edit Section"
   echo "a. EDIT NAME " 
   echo "b. EDIT EMAIL"
   echo "c. EDIT NUMBER 1"
   echo "d. EDIT NUMBER 2"
   echo "e. EDIT ADDRESS"
   read -p "enter your choice: " edit_choice
   case $edit_choice in
   a)read -p "New new name : " edit1_name
     while read -r f1 f2 f3 f4 f5; do
     if [ "$edit_name" == "$f1" -o "$edit_name" == "$f3" -o "$edit_name" == "$f4" ]
     then
     sed -i -e "/$edit_name/d" $user_name.csv
     echo -e "$edit1_name\t$f2\t$f3\t$f4\t$f5\n" >> $user_name.csv
     fi
     done < $user_name.csv
     echo -e "\n\nNew Contact is\n"
     grep -i $edit1_name "$user_name.csv"  
     ;;
    b)read -p "New email : " edit1_email
     while read -r f1 f2 f3 f4 f5; do
     if [ "$edit_name" == "$f1" -o "$edit_name" == "$f3" -o "$edit_name" == "$f4" ]
     then
     sed -i -e "/$edit_name/d" $user_name.csv
     echo -e "$f1\t$edit1_email\t$f3\t$f4\t$f5\n" >> $user_name.csv
     fi
     done < $user_name.csv
     echo -e "\n\nNew Contact is\n"
     grep -i $edit1_email "$user_name.csv" 
     ;;
    c)read -p "New number 1 : " edit1_number1
     while read -r f1 f2 f3 f4 f5; do
     if [ "$edit_name" == "$f1" -o "$edit_name" == "$f3" -o "$edit_name" == "$f4" ]
     then
     sed -i -e "/$edit_name/d" $user_name.csv
     echo -e "$f1\t$f2\t$edit1_number1\t$f4\t$f5\n" >> $user_name.csv
     fi
     done < $user_name.csv
     echo -e "\n\nNew Contact is\n"
     grep -i $edit1_number1 "$user_name.csv"
     ;;
    d)read -p "New number 2 : " edit1_number2
     while read -r f1 f2 f3 f4 f5; do
     if [ "$edit_name" == "$f1" -o "$edit_name" == "$f3" -o "$edit_name" == "$f4" ]
     then
     sed -i -e "/$edit_name/d" $user_name.csv
     echo -e "$f1\t$f2\t$f3\t$edit1_number2\t$f5\n" >> $user_name.csv
     fi
     done < $user_name.csv
     echo -e "\n\nNew Contact is\n"
     grep -i $edit1_number2 "$user_name.csv"
     ;; 
    e)read -p "New Address : " edit1_add
     while read -r f1 f2 f3 f4 f5; do
     if [ "$edit_name" == "$f1" -o "$edit_name" == "$f3" -o "$edit_name" == "$f4" ]
     then
     sed -i -e "/$edit_name/d" $user_name.csv
     echo -e "$f1\t$f2\t$f3\t$f4\t$edit1_add\n" >> $user_name.csv
     fi
     done < $user_name.csv
     echo -e "\n\nNew Contact is\n"
     grep -i $edit1_add "$user_name.csv"
     ;;
    *);;
    esac;
  else
  echo -e "User not found!!"
  fi
  ;;
5) echo -e "\n-----------------------------------PHONEBOOK------------------------------\n\n"
   cat $user_name.csv
   ;;
6)break;;
*)echo " invalid command ";;
esac;
echo -e "\n\npress 6 to quit , anything else to return to main menu\n"
read -p "" confirm_exit
if ["$confirm_exit" == "6"];
then break
fi
done
}


while : 
do
echo -e "\n------------------------------------WELCOME-------------------------------------\n\n"
echo -e "Enter your choice :\n1.login\n2.signup\n3.Exit"
read -p "your choice :  " ch
clear
case $ch in
1)echo -e "\n------------------------------------WELCOME-------------------------------------\n\n"
  read -p "Enter username :  " user_name
  read -p "Enter password :  " user_password
  if
  grep -F "$user_name:$user_password" master.csv >> login.csv
  then
  echo -e "\nLogin Successfull!!!\n\n"
  read -p "Press Enter to continue:  " enter
  phone
  else
  echo -e "\ninvalid username or password\n\n"
  read -p "Press Enter to go to main menu:  " enter
  fi
  clear
  ;;
2)echo -e "\n------------------------------------WELCOME-------------------------------------\n\n"
  read -p "Enter username :  " user_name
  read -p "Enter password :  " user_password
  echo -e "$user_name:$user_password" >> master.csv 
  echo -e "\n User account created!!!"
  echo -e "Name\tEmail\tMob Number 1\tMob Number 2\taddress\n" >> $user_name.csv
  read -p "Press Enter to continue:  " enter
  phone
  clear
  ;;
3)break;;
*)echo -e "\ninvalid command!! plz try again..\n\n"
  read -p "Press enter to go to main menu " enter
  clear
  ;;
esac;
done 








