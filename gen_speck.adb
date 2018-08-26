package body Gen_Speck is

   Alpha : constant Natural := (if Word'Modulus = 2**16 then 7 else 8);
   Beta : constant Natural := (if Word'Modulus = 2**16 then 2 else 3);

   function Expand_Key (K : Key) return Expanded_Key is
      L : array (0 .. M - 2) of Word;
      I1 : Integer := 0;

      Exp_K : Expanded_Key;
   begin
      for I in L'Range loop
         L (I) := K (I + 1);
      end loop;

      Exp_K (0) := K (0);

      for I in Exp_K'First .. Exp_K'Last - 1 loop
         L (I1) := (Exp_K (I) + Rotate_Right (L (I1), Alpha)) xor Word (I);
         Exp_K (I + 1) := Rotate_Left (Exp_K (I), Beta) xor L (I1);

         if I1 = L'Last then
            I1 := 0;
         else
            I1 := I1 + 1;
         end if;
      end loop;

      return Exp_K;
   end Expand_Key;

   function Encrypt (Exp_K : Expanded_Key; Plain_Text : Block) return Block is
      X : Word := Plain_Text.X;
      Y : Word := Plain_Text.Y;
   begin
      for I in Exp_K'Range loop
         X := (Rotate_Right (X, Alpha) + Y) xor Exp_K (I);
         Y := Rotate_Left (Y, Beta) xor X;
      end loop;

      return Block'(X, Y);
   end Encrypt;

   function Decrypt (Exp_K : Expanded_Key; Cypher_Text : Block) return Block is
      X : Word := Cypher_Text.X;
      Y : Word := Cypher_Text.Y;
   begin
      for I in reverse Exp_K'Range loop
         Y := Rotate_Right (X xor Y, Beta);
         X := Rotate_Left ((X xor Exp_K (I)) - Y, Alpha);
      end loop;

      return Block'(X, Y);
   end Decrypt;

end Gen_Speck;
