
--  CREATE DATABASE
CREATE DATABASE brief_myresources.
--  CREATE THE USERS TABLE
 CREATE TABLE utilisateur (
   user_id int(11) PRIMARY KEY auto_increment,
   u_name varchar(255),
   u_email varchar(255) unique
   
   );
 --  CREATE THE SQUAD TABLE
   CREATE TABLE squad(
     squad_id int(11) PRIMARY KEY auto_increment,
     project_id int(11)
     );
     --  CREATE THE RELATION TABLE BETWEEN SQUAD AND USER
 CREATE TABLE squad_members(
      user_id int(11),
      squad_id int(11),
      le_rol varchar(255),
      primary key (user_id,squad_id),
      CONSTRAINT const_user
      FOREIGN KEY(user_id) REFERENCES utilisateur(user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
      CONSTRAINT const_squad
      FOREIGN KEY(squad_id) REFERENCES squad(squad_id)
      ON DELETE CASCADE ON UPDATE CASCADE
     );

 --  CREATE THE Project TABLE
       CREATE TABLE Project (
       project_id int(11) PRIMARY KEY auto_increment ,
       nom_projet varchar(255),
       description varchar(500),
       date_debut varchar(255),
       date_fin varchar(255)
     );
 -- CREATE THE Ressources TABLE  
    CREATE TABLE Ressources (
     ressource_id int(11) PRIMARY KEY auto_increment,
     categorie_id int(11),
     sub_cat_id  int(11),
     squad_id int(11),
     project_id int(11),
     FOREIGN KEY (squad_id) REFERENCES squad(squad_id),
     FOREIGN KEY (project_id) REFERENCES Project(project_id)
     
     );
 -- CREATE THE Categorie TABLE 
    CREATE TABLE Categorie (
     categorie_id int(11) PRIMARY KEY auto_increment,
     nom_categorie varchar(255)
     );
 -- CREATE THE Subcategory TABLE 
    CREATE TABLE Subcategory (
     sub_cat_id  int(11) PRIMARY KEY auto_increment,
     categorie_id int(11),
     nom_sub_categorie varchar(255),
      FOREIGN KEY (categorie_id) REFERENCES Categorie(categorie_id)
     );
    --  make the colum 'project_id' in table squad a foreign key to project table
    ALTER TABLE squad
    ADD CONSTRAINT const_5squad
    FOREIGN KEY (project_id)
    REFERENCES project(project_id);
    --  make the colum 'categorie_id'&'sub_cat_id' in
    --  table ressources a foreign key to categorie subcategorie tables
    ALTER TABLE ressources
    ADD CONSTRAINT const_ressources_categorie
    FOREIGN KEY (categorie_id)
    REFERENCES categorie(categorie_id);
   
    ALTER TABLE ressources
    ADD CONSTRAINT const_ressources_subcategory
    FOREIGN KEY (sub_cat_id)
    REFERENCES subcategory(sub_cat_id);
    -- ADD USERS IN THE TABLE utilisateur 
    INSERT INTO utilisateur (u_name, u_email)
    VALUES ('mbarek el aadraoui', 'm.elaadraoui@gmail.com');
    INSERT INTO utilisateur (u_name, u_email)
    VALUES ('latifa el', 'latifa@gmail.com');
    INSERT INTO utilisateur (u_name, u_email)
    VALUES ('youness el', 'youness@gmail.com');
    INSERT INTO utilisateur (u_name, u_email)
    VALUES ('nabil elhakimi', 'nabil@gmail.com');
    -- ADD project IN THE TABLE project 
    INSERT INTO Project (nom_projet,description,date_debut,date_fin)
    VALUES ('scrumboard','make a siteweb for managment the project','11/11/2023','20/11/2023');
    -- create asquad and Assignment to it a project from project table 
    INSERT INTO squad (project_id)
    VALUES (1);
    -- add a users to the squad 
    INSERT INTO squad_members (user_id,squad_id, le_rol)
    VALUES (1,1,'leader');
    INSERT INTO squad_members (user_id,squad_id, le_rol)
    VALUES (2,1,'member');
    INSERT INTO squad_members (user_id,squad_id, le_rol)
    VALUES (3,1,'member');
    INSERT INTO squad_members (user_id,squad_id,le_rol)
    VALUES (4,1,'member');
    -- create a categorie
    INSERT INTO categorie (nom_categorie)
    VALUES ('sololearn');
    -- create subcategorie  
    INSERT INTO subcategory (categorie_id,nom_sub_categorie	)
    VALUES (1,'sololearn-mysql');
    -- create a ressources 
    INSERT INTO ressources (categorie_id,sub_cat_id,squad_id,project_id)
    VALUES (1,1,1,1);
-- as a full stack devloper i modify the name of an user from younes el to youness benani
    UPDATE utilisateur
    SET u_name ='youness benani'
    WHERE user_id=3;
-- as a full stack devloper i modify the name of table utilisateur to users
    ALTER TABLE utilisateur RENAME users
-- as a full stack devloper i added a new member to the squad 1 
    INSERT INTO users (u_name, u_email)
    VALUES ('mohamed amine', 'm.amine@gmail.com');
    INSERT INTO squad_members (user_id,squad_id, le_rol)
    VALUES (5,1,'member');
-- as a full stack devloper i modify the deadline of the project
    UPDATE project 
    SET date_fin= '29/11/2023'
    WHERE project_id =1;
    -- afficher tout les data in mysql
    SELECT * FROM users INNER JOIN squad_members
    on users.user_id=squad_members.user_id
    INNER JOIN squad 
    on squad.squad_id=squad_members.squad_id 
    INNER JOIN project 
    on squad.project_id=project.project_id 
    INNER JOIN ressources 
    on squad.squad_id=ressources.squad_id 
    INNER JOIN subcategory 
    on ressources.sub_cat_id=subcategory.sub_cat_id 
    INNER JOIN categorie
    on subcategory.categorie_id=categorie.categorie_id;