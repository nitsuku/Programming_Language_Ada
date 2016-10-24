package Candidate is
--
--Program Made for a Programming Language Class Homework
--Program take's user input for views, and compares those
--views to input candidates to determine strongest matches.
--
--@Author: Nick Faccenda, Amanda Verno, Tin Buzancic
--@Version 10-23-2016



   -- Array of integers to represent views
   type View_Type is array( 1..10 ) of Integer;

   --Candidates' struct
   type Candidate_Type is
   record
     name : String( 1..1 );
	 view : View_Type;
	 score : Integer;
   end record;

   --Array of Candidates
   type Candidate_List_Type is array( Positive Range <> ) of Candidate_Type;






   --Function that will print the best candidate(s)
   Procedure Best(Candidates : in Candidate_List_Type ;
		 Max_Score : in Integer ) ;



   --This method will take the user view and commpare each view to the corresponding
   --view from each candidate, create a new array and pass that to the Best method
   --for printing after determining the best candidate(s)
   Procedure Compare(User_View : In View_Type ;
		     Candidate_List : In Out Candidate_List_Type ;
		    Max_Score : Out Integer) ;

   --Obtain user input for the views to be used in
   --the View_Type struct
   procedure Get( View : out View_Type );

   --Obtain user input for the candidates name,
   --then uses Get above to get the correct View assigned
   procedure Get( Candidates : out Candidate_List_Type );


end Candidate;
