with Gen_Speck;

generic
   with package Speck is new Gen_Speck (<>);
package Test_Speck is

   procedure Run_Test (Message : in String;
                       Plain_Text : in Speck.Block;
                       Cypher_Text : in Speck.Block;
                       K : in Speck.Key);

end Test_Speck;
