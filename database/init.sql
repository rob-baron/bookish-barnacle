-- A simple database to use to initialize postgres
CREATE TABLE part (part_id int, part_name varchar(50));
CREATE TABLE widget (
    assembly_id int,
    status varchar(50),
    kit_num int
);
create table part2widget (part_id int, assembly_id int);