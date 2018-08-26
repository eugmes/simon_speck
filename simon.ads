with Interfaces;
with Gen_Simon;

--  @summary
--  Concrete Simon cypher packages
--
--  @description
--  This package contains instantiations of Gen_Simon package described in
--  the specification for with sizes available in Interfaces package.
package Simon with Pure is

   use Interfaces;

   package Simon_32_64 is new
         Gen_Simon (Word => Unsigned_16, M => 4, T => 32, J => 0);

   package Simon_64_96 is new
         Gen_Simon (Word => Unsigned_32, M => 3, T => 42, J => 2);
   package Simon_64_128 is new
         Gen_Simon (Word => Unsigned_32, M => 4, T => 44, J => 3);

   package Simon_128_128 is new
         Gen_Simon (Word => Unsigned_64, M => 2, T => 68, J => 2);
   package Simon_128_192 is new
         Gen_Simon (Word => Unsigned_64, M => 3, T => 69, J => 3);
   package Simon_128_256 is new
         Gen_Simon (Word => Unsigned_64, M => 4, T => 72, J => 4);

end Simon;
