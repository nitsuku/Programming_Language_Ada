with Ada.Text_IO; use Ada.Text_IO;

with Candidate; use Candidate;
--
--Program Made for a Programming Language Class Homework
--Program take's user input for views, and compares those
--views to input candidates to determine strongest matches.
--
--@Author: Nick Faccenda, Amanda Verno, Tin Buzancic
--@Version 10-19-2016


--Obtains User Input, puts into objects, passes them into Compare method
procedure main is

   package Int_IO is new Ada.Text_IO.Integer_IO( Integer );




   --User's View
   User_View : Candidate.View_Type;

   --How many candidates do we have
   Num_Of_Cand : Integer := 0;
   Max : Integer := 0;

   Data_Set1 : Candidate.Candidate_List_Type( 1..7) :=
     (
        1 => ( "A", (1,   1,   1,   1,   1,   1,   1,   1,   1,   1),  0 ),
	2 => ( "B", (-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1),  0 ),
	3 => ( "C", (1,  -1,   1,  -1,   1,  -1,   1,  -1,   1,  -1),  0 ),
	4 => ( "D", (1,   0,   1,   0,   1,   0,   1,   0,   1,   0),  0 ),
	5 => ( "E", (0,  -1,   0,  -1,   0,  -1,   0,  -1,   0,  -1),  0 ),
	6 => ( "F", (1,   1,   1,   1,   0,   0,   0,   0,   0,   0),  0 ),
	7 => ( "G", (0,   0,   0,   1,  -1,   0,   0,  -1,   1,   1),  0 )
      );
   Data_SetUser : Candidate.View_Type :=
     ( 0, 0, 0, 1, 1, 1, -1, -1, -1, 1);

begin
    Candidate.Compare(Data_SetUser, Data_Set1, Max);
   Candidate.Best(Candidates => Data_Set1, Max_Score => Max);

   Get(User_View);

   Put( "Enter number of Candidates: " );
   Int_IO.Get(Item => Num_Of_Cand);
   Put_Line( "You entered: " & Integer'Image(Num_Of_Cand));

   declare
      Candidate_Views : Candidate_List_Type( 1..Num_Of_Cand);

   begin

      Candidate.Get(Candidates => Candidate_Views);
      Compare(User_View, Candidate_Views, Max);
      Best(Candidates => Candidate_Views, Max_Score => Max);
   end;

end main; --yay we made it
