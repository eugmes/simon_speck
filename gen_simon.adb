package body Gen_Simon is

   --  TODO: File a bug in GNAT about those warnings.
   pragma Warnings (Off, "literal ""'0'"" is not referenced");
   pragma Warnings (Off, "literal ""'1'"" is not referenced");

   type Bit is ('0', '1')
       with Size => 1;

   type Bit_Array is array (0 .. 61) of Bit
       with Pack;

   Z : constant array (0 .. 4) of Bit_Array :=
       ("11111010001001010110000111001101111101000100101011000011100110",
        "10001110111110010011000010110101000111011111001001100001011010",
        "10101111011100000011010010011000101000010001111110010110110011",
        "11011011101011000110010111100000010010001010011100110100001111",
        "11010001111001101011011000100000010111000011001010010011101111");

   function F (X : Word) return Word
       with Inline;

   function F (X : Word) return Word is
   begin
      return (Rotate_Left (X, 1) and Rotate_Left (X, 8))
         xor Rotate_Left (X, 2);
   end F;

   function Expand_Key (K : Key) return Expanded_Key is
      Tmp : Word;
      Exp_K : Expanded_Key;
   begin
      for I in K'Range loop
         Exp_K (I) := K (I);
      end loop;

      for I in M .. T - 1 loop
         Tmp := Rotate_Right (Exp_K (I - 1), 3);

         if M = 4 then
            Tmp := Tmp xor Exp_K (I - 3);
         end if;

         Tmp := Tmp xor Rotate_Right (Tmp, 1);

         Exp_K (I) := (not Exp_K (I - M))
                  xor Tmp
                  xor Word (Bit'Pos (Z (J)((I - M) mod 62)))
                  xor 3;
      end loop;

      return Exp_K;
   end Expand_Key;


   function Encrypt (Exp_K : Expanded_Key; Plain_Text : Block) return Block is
      X : Word := Plain_Text.X;
      Y : Word := Plain_Text.Y;
      Temp : Word;
   begin
      for I in Exp_K'Range loop
         Temp := X;
         X := Y xor F (X) xor Exp_K (I);
         Y := Temp;
      end loop;

      return Block'(X, Y);
   end Encrypt;

   function Decrypt (Exp_K : Expanded_Key; Cypher_Text : Block) return Block is
      X : Word := Cypher_Text.X;
      Y : Word := Cypher_Text.Y;
      Temp : Word;
   begin
      for I in reverse Exp_K'Range loop
         Temp := Y;
         Y := X xor F (Y) xor Exp_K (I);
         X := Temp;
      end loop;

      return Block'(X, Y);
   end Decrypt;

end Gen_Simon;
