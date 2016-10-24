with Ada.Text_IO;
use Ada.Text_IO;
--
--Program Made for a Programming Language Class Homework
--Program take's user input for views, and compares those
--views to input candidates to determine strongest matches.
--
--@Author: Nick Faccenda, Amanda Verno, Tin Buzancic
--@Version 10-23-2016

package body Candidate is

   package INT_IO is new Ada.Text_IO.Integer_IO(integer);

   --Function that will print the best candidate(s)
   Procedure Best(Candidates : in Candidate_List_Type ;
		 Max_Score : in Integer ) is
   begin
      for Iterator in Candidates'Range loop
	 if Candidates(Iterator).score = Max_Score then
	    Put_Line( Candidates(Iterator).name );
	 end if;
	 end loop;

   end Best;



   --This method will take the user view and commpare each view to the corresponding
   --view from each candidate, create a new array and pass that to the Best method
   --for printing after determining the best candidate(s)
   Procedure Compare(User_View : In View_Type ;
		     Candidate_List : In Out Candidate_List_Type ;
		    Max_Score : Out Integer) is
   begin
      Max_Score := 0;
      for Each_Candidate in Candidate_List'Range loop

	 for Each_View in Candidate_List(Each_Candidate).view'range loop
	    if User_View(Each_View) = Candidate_List(Each_Candidate).view(Each_View) then
	       if User_View(Each_View) /= 0 then
			Candidate_List(Each_Candidate).score := ( Candidate_List(Each_Candidate).score + 1 );
		end if;
	    elsif (User_View(Each_View) =  1 and Candidate_List(Each_Candidate).view(Each_View) = -1) or
	          (User_View(Each_View) = -1 and Candidate_List(Each_Candidate).view(Each_View) =  1) then
		    Candidate_List(Each_Candidate).score := ( Candidate_List(Each_Candidate).score - 1 );
	    end if;
	 end loop;
	 if Candidate_List(Each_Candidate).score > Max_Score then
	   Max_Score := Candidate_List(Each_Candidate).score;
         end if;
      end loop;
   end Compare;




   --This method will take the user view and commpare each view to the corresponding
   --view from each candidate, create a new array and pass that to the Best method
   --for printing after determining the best candidate(s)
   procedure Get( View : out View_Type ) is
   begin
      Put( "Enter views:  " );
      for View_Number in View_Type'Range loop
	 Int_IO.Get(Item => View(View_Number));
     end loop;
   end Get;

   --Obtain user input for the views to be used in
   --the View_Type struct
   procedure Get( Candidates : out Candidate_List_Type ) is
   begin
      for x in Candidates'Range loop
	 Put( "Enter Candidate's name: " );
	 Ada.Text_IO.Get( Candidates(x).name );
	 Get( Candidates(x).view );
	 Candidates(x).score := 0;
      end loop;
   end Get;




end Candidate;
