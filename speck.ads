with Interfaces;
with Gen_Speck;

--  @summary
--  Concreate Speck cypher packages.
--  @description
--  This package contains instantiations of Gen_Speck package described in
--  the specification for with sizes available in Interfaces package.
package Speck with Pure is

   use Interfaces;

   package Speck_32_64 is new
         Gen_Speck (Word => Unsigned_16, M => 4, T => 22);

   package Speck_64_96 is new
         Gen_Speck (Word => Unsigned_32, M => 3, T => 26);
   package Speck_64_128  is new
         Gen_Speck (Word => Unsigned_32, M => 4, T => 27);

   package Speck_128_128 is new
         Gen_Speck (Word => Unsigned_64, M => 2, T => 32);
   package Speck_128_192 is new
         Gen_Speck (Word => Unsigned_64, M => 3, T => 33);
   package Speck_128_256 is new
         Gen_Speck (Word => Unsigned_64, M => 4, T => 34);

end Speck;
