create database insurance;
use insurance;
select * from insurance;
desc insurance;


#1. Count for each categories of ‘region
select region,count(*) count from  insurance group by  region;


#2. Find 50 records of highest ‘age’ and export data/table to desktop 
select * from insurance order by age desc limit 50;


#3. Add index name ‘quick’ on ‘id’
alter table insurance add quick varchar(20);
create index quick on insurance(id);
show index from insurance;
 
create index index_quick on insurance (id);           # syntax:- Create index index_name on table_name (column name)
show index from insurance;


#4. Describe the schema of table 
desc insurance;
#5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 
select* from insurance;
create view gender as (select id,age,bmi,children,smoker,region,charges from insurance);
select* from gender;


#6. Rename the view as ‘type’ 
#rename VIEW old_view_name TO new_view_name;
rename table gender to type;

#7. Count how many are ‘northwest’ insurance holders 
select region,count(*)count  from insurance where region='northwest';
select region,count(*) as count from insurance where region = 'northwest';


#8. Count how many insurance holders were ‘femail’ 
select* from insurance;
select sex,count(*) as count from  insurance where sex='femail';
select sex,count(*) as count from insurance where sex='female';

#9. Create Primary key on a suitable column 
select id from insurance group by id having count(id)>1;     # you can see there is no duplicated records in id column and it doesnot have any null values so we can make id as primary key
alter table insurance modify id int primary key;
describe insurance;

select id from insurance group by id having count(id)>1;
alter table insurance modify id int primary key;
desc insurance;

#10. Create a new column ‘ratio’ which is age multiply by bmi 
select* from insurance;
update insurance set ratio=age*bmi;
select * from insurance;# error


#11. Arrange the table from high to low according to charges 
select * from insurance order by charges desc;
#12. Find MAX of ‘charges’ 
select max(charges) as Max_Charges from insurance;

#13. Find MIN of ‘charges’ 
select min(charges) as min_charges from insurance;


#14. Find average of ‘charges’ of male and female 
select * from insurance;
select sex,avg(charges) as average_charges from insurance group by sex;
select sex,avg(charges) as Average_charges from insurance group by sex;


#15. Write a Query to rename column name sex to Gender
alter table insurance change sex Gender varchar(10);
#change



#16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW 
alter table insurance add  column hl_charges varchar(50);
select* from insurance ;
select avg(charges) from insurance;
update insurance set HL_Charges = case when charges<13270 then 'Low' when charges>13270 then 'High' end ;



#17. Change location/position of ‘smoker’ and bring before ‘children’ 
select* from insurance ;
alter table insurance modify smoker text after bmi;


#18. Show top 20 records
select * from insurance limit 20;


 #19. Show bottom 20 records 
 select * from insurance order by id desc limit 20;

#20. Randomly select 20% of records and export to desktop 
select round(0.2*count(*),0) from insurance;
select * from insurance order by rand() limit 268;
#nu

#21. Remove column ‘ratio’ 
alter table insurance drop column ratio;
alter table insurance drop column ratio;
#error


#22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using # 


#23. Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children 

create view Female_HL_Charges as (select * from insurance where HL_Charges='High' and Gender = 'Female' and smoker = 'yes' and children = 0);
select * from Female_HL_Charges;

#24. Update children column if there
# is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children, 
#if 4 then four_children if 5 then five_children else print it as More_than_five_children.

alter  table insurance modify children varchar(20);
update insurance set children = case children when 0 then 'Zero_Children' when 1 then 'One_Children' when 2 then 'Two_Children' when 3 then 'Three_Children'
when 4 then 'Four_children' when 5 then 'Five_children' else 'More_than_Five_Children' end;

select * from insurance;

#25. Mail the script to jeevan.raj@imarticus.com by EOD.

