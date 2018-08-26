with Ada.Text_IO;

package body Test_Speck is

   procedure Run_Test (Message : in String;
                       Plain_Text : in Speck.Block;
                       Cypher_Text : in Speck.Block;
                       K : in Speck.Key)
   is
      package TIO renames Ada.Text_IO;
      use type Speck.Block;

      Temp : Speck.Block;
      Exp_K : Speck.Expanded_Key;
   begin
      TIO.Put_Line (Message);

      Exp_K := Speck.Expand_Key (K);
      Temp := Speck.Encrypt (Exp_K, Plain_Text);

      if Temp = Cypher_Text then
         TIO.Put_Line ("ENCRYPT OK");
      else
         TIO.Put_Line ("ENCRYPT FAILED");
      end if;

      Temp := Speck.Decrypt (Exp_K, Cypher_Text);

      if Temp = Plain_Text then
         TIO.Put_Line ("DECRYPT OK");
      else
         TIO.Put_Line ("DECRYPT FAILED");
      end if;

      TIO.New_Line;

   end Run_Test;

end Test_Speck;
