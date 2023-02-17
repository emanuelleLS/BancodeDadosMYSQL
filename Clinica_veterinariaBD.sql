create table proprietario( ID_cliente int(5) NOT NULL PRIMARY KEY ,
                           nome char(30) NOT NULL,
                           CPF int(12) NOT NULL,
                           endereco char(30),
                           numero1 int(11),
                           numero2 int(11));
 
 create table animal(ID_animal int(5) NOT NULL PRIMARY KEY,
                     ID_cliente int(5) NOT NULL,
                     nome char(30) not null,
                     idade int(2),
                     raça char(30),
                     peso_gramas int(5));
                     
create table funcionario(ID_funcionario int(5) NOT NULL PRIMARY KEY,
						funcao char(30),
                        nome char(50) NOT NULL,
                        cpf int(12));
create table clinica(ID_clinica int(5) NOT NULL PRIMARY KEY, 
					nome char(30) NOT NULL,
                    endereco char(50));
create table procedimentos(ID_procedimentos int(5) NOT NULL PRIMARY KEY,
						vacina char(30),
                        vermifugo char(10),
                        cirurgia char(30),
                        exame char(30));

Alter table procedimentos modify column vermifugo date;
                        
Alter table prontuario add constraint FKanimal foreign key (ID_animal) references animal(ID_animal);    
Alter table prontuario add constraint FKprocedimentos foreign key (ID_procedimentos) references procedimentos(ID_procedimentos); 
                       
                    
create table prontuario(ID_prontuario int(5) NOT NULL PRIMARY KEY,
                        ID_animal int(5) NOT NULL,
                        ID_procedimentos int(5),
                        diagnostico char(30));
                        
Alter table consulta add constraint FKprontuario foreign key (ID_prontuario) references prontuario(ID_prontuario);                        

                        
create table consulta(ID_consulta int(5) NOT NULL PRIMARY KEY,
                      ID_animal int(5) NOT NULL,
                      ID_funcionario int(5),
                      ID_prontuario int(5),
                      agendamento timestamp(6));
                      
 
 
 insert into proprietario( ID_cliente, nome, CPF, endereco, numero1,  numero2) values (0002, "Ana Silva", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0003, "Beatriz Fernandes", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0004, "Carlos Nogueira", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0005, "Daiane dos Santos", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0006, "Elizabete Souza", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0007, "Fernando Torres", 1234567891, "Rua das árvores", 429999999, null),
                                                                                       (0008, "Guilhermina Gonçalves", 1234567891, "Rua das árvores", 429999999, null);
 
 
 select *from proprietario;
 
 Alter table animal add constraint FKcliente foreign key (ID_cliente) references proprietario(ID_cliente);
                      
insert into animal(ID_animal, ID_cliente,nome,idade, raça, peso_gramas, especie) values (1000, 0008, "Totó", 5, "SRD", 4000, "cachorro"),
                                                                                          (1001, 0007, "Bolinha", 1, "YorkShire", 1000, "cachorro"),
                                                                                          (1002, 0007, "Ravena", 7, "Siamês", 3000, "gato"),
                                                                                          (1003, 0006, "Mia", 15, "SRD", 6000, "gato"),
                                                                                          (1004, 0005, "Lila", 4, "Tigre d'água",500 , "tartaruga"),
                                                                                          (1005, 0005, "Caninana", 11, "Pastor Belga", 10000, "cachorro"),
                                                                                          (1006, 0004, "Bob", 2, "Pinscher", 2000, "cachorro"),
                                                                                          (1007, 0003, "Harry", 2, "Ring Neck", 50, "Periquito"),
                                                                                          (1008, 0002, "Urso", 5, "Pastor Alemão", 12000, "cachorro"),
                                                                                          (1009, 0001, "Bunny", 7, "Albino", 5000, "coelho");

select *from animal;

insert into funcionario(ID_funcionario, funcao, nome, cpf) values(2000, "Secretária", "Sandra Nunes", 1234561234),
                                                                  (2001, "Administrador", "Cássio Silva", null),
                                                                  (2002, "Médico Veterinário", "Felipe Santos", null),
                                                                  (2003, "Auxiliar Veterinário", "Carlos Santos", null),
                                                                  (2004, "Auxiliar de limpeza", "Silvio Castro", null),
                                                                  (2005, "Assistente administrativo", "Juliana Paes", null),
                                                                  (2006, "Médico Veterinário", "Luiz Ricardo", null),
                                                                  (2007, "Recepcionista", "Antonieta Santos", null);
 select *from funcionario;  
 
insert into clinica (ID_clinica, nome, endereco) values (3000, "Cão Sarado", "Rua Vicente Machado"),
                                                         (3001, "Espaço Animal", "Rua Balduíno Taques"),
                                                         (3002, "Vida 24h", "Rua Cesar de Paula"),
                                                         (3003, "Wulf", "Rua Senador Pinheiro Machado");
						
select *from clinica;
                                                         
                      
insert into procedimentos(ID_procedimentos, vacina, vermifugo, cirurgia, exame) values (3001, "V8", 31/10/2022, null, null),
                                                                                        (3002, "v10", 22/02/2021, "Castração", "Hemograma"),
                                                                                        (3003, null, 08/12/2022, null, "Hemograma"),
                                                                                        (3004, null, null, "Castração", "Ultrassom"),
                                                                                        (3005, "raiva", null, null, null),
                                                                                        (3006, null, 02/11/2022, "Retirada de Cisto", "raio-x"),
                                                                                        (3007, "Cinomose", null, "Castração", "Hemograma");
					
                                                                                        
update procedimentos set vermifugo= '2022-10-31' where ID_procedimentos = 3001;

																
select *from procedimentos;
                      
                      

                      

					