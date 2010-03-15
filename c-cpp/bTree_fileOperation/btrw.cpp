#include "btree.h"
#include <stdlib.h>
#include <iostream>
#include <stdlib.h>
using namespace std;

bool ReadKeyboard(KeyFieldType Word)
   {
   int k, ch;
   bool start;

   cin >> Word;
   cin.get();   // get the newline

   if (Word[0] == '.')
      return false;

   start = true;

   for (k = 0; k < KeyFieldMax; k++)
      {
      ch = Word[k];
      if (ch == NULL)
         start = false;
      if (start)
         Word[k] = toupper(ch);   // capitalize
      else
         Word[k] = ' ';   // pad with blanks
      }

   Word[KeyFieldMax] = NULL;
   return true;
   }



const int LineMax = KeyFieldMax + DFMaxPlus1;


typedef char StringType[LineMax];


/* Given:  InStream     An input file stream open for reading.
           StringMax    The maximum number of characters that can be put
                        into String, including the NULL that marks the end
                        of the string.
   Task:   To read up to StringMax - 1 characters from InStream, storing
           them in String, but stopping if a newline is read or end of
           file or an error condition is reached.
   Return: String       The string just read, with a NULL appended to mark
                        the end of the string.  If a newline was read, it
                        is not stored in String.
           The number of characters read into String (not counting the NULL)
           is returned in the function name.
*/
int MyGetLine(istream & InStream, char * String, int StringMax)
   {
   char Ch;
   int Count, Last;

   Count = 0;
   Last = StringMax - 1;
   Ch = InStream.get();

   while ((Ch != '\n') && (! InStream.fail()))
      {
      if (Count < Last)
         String[Count++] = Ch;
      Ch = InStream.get();
      }

   String[Count] = NULL;
   return Count;
   }


/* Given:  InputFile   A file stream already opened for input on a text file.
   Task:   To read in a Word and its Definition from one line of this file.
   Return: Word        In char array form, the word read in.
           Definition  In char array form, the definition read in.
*/
void ReadLine(fstream & InputFile, KeyFieldType Word,
   DataFieldType Definition)
   {
   char Line[LineMax];
   int k, ch;

   MyGetLine(InputFile, Line, LineMax);   // will read the newline char

   for (k = 0; k < KeyFieldMax; k++)
      Word[k] = Line[k];
   Word[KeyFieldMax] = NULL;

   for (k = 0; k < DataFieldMax; k++)
      {
      ch = Line[KeyFieldMax + k];
      if (ch == '\n')
         break;
      Definition[k] = ch;
      }
   Definition[k] = NULL;
  }


/* Given:  InputFile   A file stream already opened for input.
   Task:   To read the data from InputFile and load it into the Table.
   Return: Table       The B-tree table containing the data.
*/
void Load(fstream & InputFile, BTTableClass & Table)
   {
   ItemType Item;
   int Count;

   Count = 0;
   ReadLine(InputFile, Item.KeyField, Item.DataField);

   while (! InputFile.fail())
      {
      #ifdef DEBUG
         Count++;
         if (Count == 22)
            {
            Count = 0;
            cout << endl << "Press ENTER";
            cin.get();
            }
         cout << endl << "DEBUG: ready to insert " << Item.KeyField << " ";
      #endif

      Table.Insert(Item);

      #ifdef DEBUG
         Table.Check();
      #endif

      ReadLine(InputFile, Item.KeyField, Item.DataField);
      }
   }



int main()
{
    ItemType Item;
    KeyFieldType key;
    BTTableClass btree('c', "btree.dat");

    if(btree.Empty())
        Error("Table is Empty");

    cout << "Enter the world to be looked up . to quit";

    while(ReadKeyboard(key))
    {
        if(btree.Retrieve(key, Item))
            cout << "Definition:        " << Item.DataField << endl;
        else
            cout << "Not found" << endl;
        cout << "Enter the world to be looked up . to quit";
    }

   fstream Source;

   Source.open("btreecw.txt", ios::in);
   if (Source.fail())
      {
      cerr << "ERROR: Unable to open file btreecw.txt" << endl;
      exit(1);
      }

   Load(Source, btree);
   Source.close();

   cout << endl;

    cout << "Enter the world to be looked up . to quit";


   while(ReadKeyboard(key))
   {
       if(btree.Retrieve(key, Item))
           cout << "Definition:        " << Item.DataField << endl;
       else
           cout << "Not found" << endl;
       cout << "Enter the world to be looked up . to quit";
   }

   return 0;

}
