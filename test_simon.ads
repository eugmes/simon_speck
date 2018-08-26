with Gen_Simon;

generic

   with package Simon is new Gen_Simon (<>);

package Test_Simon is

   procedure Run_Test (Message : in String;
                       Plain_Text : in Simon.Block;
                       Cypher_Text : in Simon.Block;
                       K : in Simon.Key);

end Test_Simon;
