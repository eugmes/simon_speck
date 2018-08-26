with Ada.Text_IO;

package body Test_Simon is

   procedure Run_Test (Message : in String;
                       Plain_Text : in Simon.Block;
                       Cypher_Text : in Simon.Block;
                       K : in Simon.Key)
   is
      package TIO renames Ada.Text_IO;
      use type Simon.Block;

      Temp : Simon.Block;
      Exp_K : Simon.Expanded_Key;
   begin
      TIO.Put_Line (Message);

      Exp_K := Simon.Expand_Key (K);
      Temp := Simon.Encrypt (Exp_K, Plain_Text);

      if Temp = Cypher_Text then
         TIO.Put_Line ("ENCRYPT OK");
      else
         TIO.Put_Line ("ENCRYPT FAILED");
      end if;

      Temp := Simon.Decrypt (Exp_K, Cypher_Text);

      if Temp = Plain_Text then
         TIO.Put_Line ("DECRYPT OK");
      else
         TIO.Put_Line ("DECRYPT FAILED");
      end if;

      TIO.New_Line;

   end Run_Test;

end Test_Simon;
