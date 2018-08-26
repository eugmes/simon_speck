--  @summary
--  Generic NSA Simon block cypher implementation.
generic

   type Word is mod <>;

   with function Rotate_Left (Value : Word; Amount : Natural)
         return Word is <>;
   with function Rotate_Right (Value : Word; Amount : Natural)
         return Word is <>;

   M : Natural;
   --  Number of key words.

   T : Natural;
   --  Number of rounds.

   J : Natural;
   --  Round constants sequence index.

package Gen_Simon with Pure is

   --  Block of plain text or cypher text data, two words.
   type Block is record
      X, Y : Word;
   end record;

   type Key is array (0 .. M - 1) of Word;

   type Expanded_Key is array (0 .. T - 1) of Word;

   function Expand_Key (K : Key) return Expanded_Key;
   --  Expand the given key.

   function Encrypt (Exp_K : Expanded_Key; Plain_Text : Block) return Block;
   --  Encrypt the given plain text block using expanded key.

   function Decrypt (Exp_K : Expanded_Key; Cypher_Text : Block) return Block;
   --  Decrypt the given cypher text block using expanded key.

end Gen_Simon;
