# night_writer
Mod 1 Final Solo Project

This project translates alphanumeric text to braille (with raised dots
represented as '0' and empty spaces represented as '.'). Currently, only
alphabet characters (a through z) and spaces are supported. Uppercase characters
will automatically be converted to lowercase. Numbers, case sensitivity, and
special characters may come later!

Files must be in a .txt format to be translated correctly. To translate alpha to
braille, use `night_writer.rb`; to translate from braille back to alpha, use
`night_reader.rb`.

Each file takes two command-line arguments, the first is the file to be
translated and the second is the file where the translated text will be placed.
The first file must already exist, but the second will be created or overwritten
automatically.

Example usage: `ruby lib/night_writer.rb message.txt braille_message.txt`
(This command will take an alphanumeric message in message.txt, translate it to
braille, and save the translation to braille_message.txt)

Enjoy!
