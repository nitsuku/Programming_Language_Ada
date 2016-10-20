with Ada.Text_IO; use Ada.Text_IO;
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


   -- Array of integers to represent views
   type View_Type is array( 1..10 ) of Integer;

   --Candidates' struct
   type Candidate_Type is
   record
     name : String( 1..1 );
     view : View_Type;
   end record;

   --Array of Candidates
   type Candidate_List_Type is array( Positive Range <> ) of Candidate_Type;

   --Struct for Candidate Values to compute best
   type Candidate_Scores_Type is
	record
	 name : String( 1..1 );
	 value : Integer;
      end record;

   --Array to hold Candidate_Scores
   type Candidate_Score_Type is array( Positive Range <> ) of Candidate_Scores_Type;

   --Function that will print the best candidate(s)
   Procedure Best(Candidates : in Candidate_Score_Type ;
		 size : Integer) is
	 result : String( 1..(2*Candidates'Size));

   begin
      for Current in 1..size loop
	 if Current = 1 then
	    result := Candidates(Current).name;
	   end if;
      end loop;

   end Best;



   --This method will take the user view and commpare each view to the corresponding
   --view from each candidate, create a new array and pass that to the Best method
   --for printing after determining the best candidate(s)
   Procedure Compare(User_View : In View_Type ;
		     Candidate_List : In Candidate_List_Type) is
      score : Integer := 0;
      Cand_Scores : Candidate_Score_Type( Candidate_List'Range );
   begin

      for Each_Candidate in Candidate_List'Range loop
	    Cand_Scores(Each_Candidate).name := Candidate_List(Each_Candidate).name;
	 for Each_View in Candidate_List(Each_Candidate).view'range loop
	    if User_View(Each_View) = Candidate_List(Each_Candidate).view(Each_View) then
	      score := ( score + 1 );
	       elsif User_View(Each_View) = 1 and Candidate_List(Each_Candidate).view(Each_View) = -1 then
		  score := ( score - 1 );
		    elsif User_View(Each_View) = -1 and Candidate_List(Each_Candidate).view(Each_View) = 1 then
		     score := ( score - 1 );
	    end if;
	    end loop;
	    Cand_Scores(Each_Candidate).value := score;
      end loop;

      Best(Cand_Scores, Candidate_List'Size);
   end Compare;


   --User's View
   User_View : View_Type;

   --How many candidates do we have
   Num_Of_Cand : Integer := 0;

begin
   Put( "Enter your views:  " );
   for View_Number in View_Type'Range loop
      Int_IO.Get(Item => User_View(View_Number));
   end loop;

    	Put( "Enter number of Candidates: " );
	Int_IO.Get(Item => Num_Of_Cand);
	Put_Line( "You entered: " & Integer'Image(Num_Of_Cand));

   declare
		Candidate_Views : Candidate_List_Type( 1..Num_Of_Cand);
		begin
		for x in Candidate_Views'Range loop
			Put( "Enter Candidate's name: " );
			Ada.Text_IO.Get( Candidate_Views(x).name );
			Put( "Enter Candidate's views: " );
			for View_Number in View_Type'Range loop
				Int_IO.Get(Item => Candidate_Views(x).view(View_Number));
			end loop;
		end loop;
		for x in Candidate_Views'Range loop
			Put_Line( "Candidate : " & Integer'Image(x) & " " & Candidate_Views(x).name );
			for View_Number in View_Type'Range loop
				Put ( Integer'Image( Candidate_Views( x ).view( View_Number ) ) & " " );
			end loop;
			New_Line;

		end loop;
      Compare(User_View, Candidate_Views);
	end;
end main; --yay we made it
