with Speck;
with Test_Speck;
with Simon;
with Test_Simon;

procedure Run_Tests is

   procedure Run_Speck_Tests;

   procedure Run_Simon_Tests;

   procedure Run_Speck_Tests is

      package Test_32_64 is new Test_Speck (Speck.Speck_32_64);

      package Test_64_96 is new Test_Speck (Speck.Speck_64_96);
      package Test_64_128 is new Test_Speck (Speck.Speck_64_128);

      package Test_128_128 is new Test_Speck (Speck.Speck_128_128);
      package Test_128_192 is new Test_Speck (Speck.Speck_128_192);
      package Test_128_256 is new Test_Speck (Speck.Speck_128_256);

   begin

      Test_32_64.Run_Test ("Speck 32/64",
            Plain_Text => (16#6574#, 16#694c#),
            Cypher_Text => (16#a868#, 16#42f2#),
            K => (16#0100#, 16#0908#, 16#1110#, 16#1918#));

      Test_64_96.Run_Test ("Speck 64/96",
            Plain_Text => (16#74614620#, 16#736e6165#),
            Cypher_Text => (16#9f7952ec#, 16#4175946c#),
            K => (16#03020100#, 16#0b0a0908#, 16#13121110#));

      Test_64_128.Run_Test ("Speck 64/128",
            Plain_Text => (16#3b726574#, 16#7475432d#),
            Cypher_Text => (16#8c6fa548#, 16#454e028b#),
            K => (16#03020100#, 16#0b0a0908#, 16#13121110#, 16#1b1a1918#));

      Test_128_128.Run_Test ("Speck 128/128",
            Plain_Text => (16#6c61766975716520#, 16#7469206564616d20#),
            Cypher_Text => (16#a65d985179783265#, 16#7860fedf5c570d18#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#));

      Test_128_192.Run_Test ("Speck 128/192",
            Plain_Text => (16#7261482066656968#, 16#43206f7420746e65#),
            Cypher_Text => (16#1be4cf3a13135566#, 16#f9bc185de03c1886#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#,
                  16#1716151413121110#));

      Test_128_256.Run_Test ("Speck 128/256",
            Plain_Text => (16#65736f6874206e49#, 16#202e72656e6f6f70#),
            Cypher_Text => (16#4109010405c0f53e#, 16#4eeeb48d9c188f43#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#,
                  16#1716151413121110#, 16#1f1e1d1c1b1a1918#));

   end Run_Speck_Tests;

   procedure Run_Simon_Tests is

      package Test_32_64 is new Test_Simon (Simon.Simon_32_64);

      package Test_64_96 is new Test_Simon (Simon.Simon_64_96);
      package Test_64_128 is new Test_Simon (Simon.Simon_64_128);

      package Test_128_128 is new Test_Simon (Simon.Simon_128_128);
      package Test_128_192 is new Test_Simon (Simon.Simon_128_192);
      package Test_128_256 is new Test_Simon (Simon.Simon_128_256);

   begin

      Test_32_64.Run_Test ("Simon 32/64",
            Plain_Text => (16#6565#, 16#6877#),
            Cypher_Text => (16#c69b#, 16#e9bb#),
            K => (16#0100#, 16#0908#, 16#1110#, 16#1918#));

      Test_64_96.Run_Test ("Simon 64/96",
            Plain_Text => (16#6f722067#, 16#6e696c63#),
            Cypher_Text => (16#5ca2e27f#, 16#111a8fc8#),
            K => (16#03020100#, 16#0b0a0908#, 16#13121110#));

      Test_64_128.Run_Test ("Simon 64/128",
            Plain_Text => (16#656b696c#, 16#20646e75#),
            Cypher_Text => (16#44c8fc20#, 16#b9dfa07a#),
            K => (16#03020100#, 16#0b0a0908#, 16#13121110#, 16#1b1a1918#));

      Test_128_128.Run_Test ("Simon 128/128",
            Plain_Text => (16#6373656420737265#, 16#6c6c657661727420#),
            Cypher_Text => (16#49681b1e1e54fe3f#, 16#65aa832af84e0bbc#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#));

      Test_128_192.Run_Test ("Simon 128/192",
            Plain_Text => (16#206572656874206e#, 16#6568772065626972#),
            Cypher_Text => (16#c4ac61effcdc0d4f#, 16#6c9c8d6e2597b85b#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#,
                  16#1716151413121110#));

      Test_128_256.Run_Test ("Simon 128/256",
            Plain_Text => (16#74206e69206d6f6f#, 16#6d69732061207369#),
            Cypher_Text => (16#8d2b5579afc8a3a0#, 16#3bf72a87efe7b868#),
            K => (16#0706050403020100#, 16#0f0e0d0c0b0a0908#,
                  16#1716151413121110#, 16#1f1e1d1c1b1a1918#));

   end Run_Simon_Tests;

begin

   Run_Speck_Tests;

   Run_Simon_Tests;

end Run_Tests;

