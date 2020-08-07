



//회원정보
select * from MEMBER_INFO;
drop table member_Info;
delete member_info;
create table member_Info(
member_seq number
,member_id varchar2(20) primary key
,member_pwd varchar2(20) not null
,member_name varchar2(20) 
,member_nickname varchar2(50) 
,member_phone varchar2(50) 
,member_birthdate date 
,member_email varchar2(50) 
,member_gender varchar2(10) 
,member_joindate date 
,member_address varchar2(300)
,member_pref_code varchar2(10)
);
insert into member_info values (member_seq.nextval,'helloworld','123','고','고수','0101220300',sysdate,'777@ee.com','여',sysdate,'오소리','0110');
insert into member_info values (member_seq.nextval,'a','123','고','고수','0101220300',sysdate,'777@ee.com','여',sysdate,'오소리','0110');
create sequence member_seq;

//상태 테이블
select * from member_status;
drop table member_status;
create table member_status(
	member_id varchar2(20) primary key,
	member_pic varchar2(20),
	member_statusmsg varchar2(500),
	member_statusimg varchar2(1000)
);

//상단 이미지 테이블
select * from top_img;
drop table top_img;
create table top_img(
	topimg varchar2(1000),
	enable number
);

//공고 정보
select * from job_post;
delete job_post where post_seq=63;
drop sequence post_seq;
create sequence post_seq;
create table job_post(
post_seq number primary key <-- 요게 공고번호
,post_corp_name varchar2(100)
,post_name varchar2(500) 
,post_url varchar2(3000) 
,post_img varchar2(1000)
,post_content varchar2(3000)
,post_period_start date 
,post_period_end date 
,post_like number  
,post_unlike number
,post_view number
,post_classi_code varchar2(10)
,post_add_date date
);

//공고 댓글
select * from post_comments;
drop table post_comments;

create sequence post_comment_seq;
create table post_comments(
post_comment_seq number
,post_comment_nickname varchar2(50)
,post_comment_content varchar2(3000) 
,post_comment_sysdate date 
);

//관리자 테이블
select * from admin_info;
drop table admin_info;

create table admin_info(
admin_id varchar2(50),
admin_pwd varchar2(50)
);

insert into admin_info values('admin','admin');


//////////////////////////////////////////////////////
board 테이블

select * from board;
drop table board;
create table board(
board_seq number primary key
,board_code varchar2(10) 
,board_user_id varchar2(20) references member_info(member_id) on delete cascade
,board_writer varchar2(50) 
,board_title  varchar2(1000) 
,board_content varchar2(3000)
,board_sysdate date 
,board_like number 
,board_unlike number 
,board_view number 
);


create table board_comments(
board_comment_parent_seq number references board(board_seq) on delete cascade
,board_comment_user_id varchar2(20) references member_info(member_id) on delete cascade
,board_comment_writer varchar2(50) 
,board_comment_content varchar2(3000) 
,board_comment_sysdate date
,board_comment_seq number
);

drop sequence board_seq;
create sequence board_seq;
create sequence board_comments_seq;


create table post_scrap(
scrap_user_seq number 
,scrap_parent_seq number
,scrap_post_name varchar2(500) 
,scrap_post_link varchar2(1000) 
,scrap_post_period_start date
,scrap_post_period_end date
);

create sequence seq_seq;
create table calboard(
seq number
,id varchar2(20)
,title varchar2(40)
,content varchar2(400)
,mdate varchar2(40)
,regdate date);

create table postboard(seq number
,id varchar2(20)
,postname varchar2(100)
,posturl varchar2(400)
,sdate date
,edate date);
