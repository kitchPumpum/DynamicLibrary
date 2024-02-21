
--INSERT INTO member_master_tbl(full_name,dob,contract_no,email,state,city,zipcode,full_address,member_id,password,account_status)
--VALUES('Hanufa Zaman', '08/12/1992', '3476264351', 'hanufazaman@gmail.com', @state,@city, @zipcode, @full_address, @member_id, @password, @account_status);



--update member_master_tbl set password='123' where member_id='hz92'


SELECT * FROM member_master_tbl WHERE member_id='hz92' AND password='123'

--INSERT INTO admin_login_tbl (username,password,full_name)
--VALUES ('AD1','345','Hanufa Zaman')

SELECT * FROM admin_login_tbl WHERE adminID='AD1' and password='345'


SELECT *, author_id, author_name FROM author_master_tbl

--INSERT INTO author_master_tbl (author_id,author_name)
--VALUES ('','')

--UPDATE author_master_tbl SET author_id='Au6' WHERE author_name='Alex Haley'

--DELETE FROM author_master_tbl WHERE author_id=

select publisher_id, publisher_name from publisher_master_tbl

select account_status,full_name,dob,contract_no,email,
state,city,zipcode,full_address, * from member_master_tbl WHERE member_id='hz92'


--update member_master_tbl set account_status='' where member_id=''

--Delete from member_master_tbl where member_id=''


select * from book_master_tbl


--INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publish_date,language,
--edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) 
--VALUES (@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,
--@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)


select * from member_master_tbl

--update book_master_tbl set book_id='B1' , book_name= 'Red Winter' , edition='1' where book_id!='B2'


--UPDATE book_master_tbl SET book_name='',genre='',author_name='',publisher_name='',publish_date='',language='',
--edition='',book_cost='',no_of_pages='',book_description='',actual_stock='',current_stock='',book_img_link=''
--WHERE book_id=''

