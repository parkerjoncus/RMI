--**************************--
-- -*- coding: utf-8 -*-
newPackage(
	"RandomMonomialIdeals",
    	Version => "1.0", 
    	Date => "May 5, 2017",
    	Authors => {
	    {
		Name => "Sonja Petrovic", 
		Email => "sonja.petrovic@iit.edu", 
		HomePage => "http://math.iit.edu/~spetrov1/"
	    },
	    {
		Name => "Despina Stasi", 
		Email => "stasdes@iit.edu", 
		HomePage => "http://math.iit.edu/~stasdes/"
	    },	
	    {
		Name => "Dane Wilburne", 
		Email => "add me", 
		HomePage => "add me"
	    },	
	    {
		Name => "Tanner Zielinski", 
		Email => "tzielin1@hawk.iit.edu", 
		HomePage => "https://www.linkedin.com/in/tannerzielinski/"
	    },	
	    {
		Name => "Daniel Kosmas", 
		Email => "dkosmas@hawk.iit.edu", 
		HomePage => "https://www.linkedin.com/in/daniel-kosmas-03160988/"
	    },
	    {
		Name => "add your name here", 
		Email => "add me", 
		HomePage => "add me, if any; if not, comment out?"
	    }	
          -- {Name=> "Contributing authors and collaborators: add any acknowledgements here", 
	  -- Email=> "",
	  -- HomePage=>""}      
	},
    	Headline => "A package for generating Erdos-Renyi-type random monomial ideals",
    	DebuggingMode => false,
	Reload => true 
    	)

export {
    "firstFunction",
    "randomGeneratingSets"
    }

--***************************************--
--  Function provided by FirstPackage.m2 --
--***************************************--

firstFunction = method(TypicalValue => String)
firstFunction ZZ := String => n -> if n == 1 then "Hello World!" else "D'oh!"

--****************************************************************--
--  Methods written by D.Wilburne and S.Petrovic for RMI, 2016-17 --
--****************************************************************--


--**********************************--
--  Methods that need documentation --
--**********************************--
randomGeneratingSets = method(TypicalValue => List)
-- INPUTS [these comments will be moved to documentation node, here for your reference for now]: 
-- n= num of vars
-- D= degree bound
-- p= prob param
-- N= sample size
randomGeneratingSets (ZZ,ZZ,RR,ZZ) := List =>  (n,D,p,N) -> (
    x :=symbol x;
    R := QQ[x_1..x_n];
    allMonomials := drop(flatten flatten apply(D+1,d->entries basis(d,R)),1);  
    -- [the following comments will be moved to documentation node and/or deleted; they are kept here for your reference for now]: 
    -- go through list allMonomials, and for each monomial m in the list, select a number in Unif(0,1); 
    -- if that number <= p, then include the monomial m in a generating set: 
    --B=select(allMonomials, m-> random(0.0,1.0)<=p) 
    -- since iid~Unif(0,1), this is same as keeping each possible monomial w/ probability p. 
    --In addition, we need a sample of size N of sets of monomials like these, so here we go: 
    B := apply(N,i-> select(allMonomials, m-> random(0.0,1.0)<=p) )
    --the result:
    -- B = list of random monomial ideal generating sets. 
)

--**********************************--
--  Methods that need reformatting  --
--**********************************--

-- TO BE ADDED BY S.P. 


--******************************************--
-- DOCUMENTATION     	       	    	    -- 
--******************************************--


beginDocumentation()
multidoc ///
 Node
  Key
   RandomMonomialIdeals
  Headline
     A package for generating Erdos-Renyi-type random monomial ideals
  Description
   Text
    {\em FirstPackage} is a basic package to be used as an example.
  Caveat
    Still trying to figure this out.
 Node
  Key
   (firstFunction,ZZ)
   firstFunction
  Headline
   a silly first function
  Usage
   firstFunction n
  Inputs
   n:
  Outputs
   :
    a silly string, depending on the value of {\tt n}
  Description
   Text
    Here we show an example.
   Example
    firstFunction 1
    firstFunction 0
///


--******************************************--
-- TESTS     	     	       	    	    -- 
--******************************************--


TEST ///
    assert ( firstFunction 2 == "D'oh!" )
///

end

You can write anything you want down here.  I like to keep examples
as I’m developing here.  Clean it up before submitting for
publication.  If you don't want to do that, you can omit the "end"
above.

