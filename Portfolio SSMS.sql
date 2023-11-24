


        --Analyzing A CSV File
		

        SELECT *
        FROM [Deaths_and_Diseases].[dbo].[World_Health_Data]
        Order By Entity;

		SELECT *
        FROM [Deaths_and_Diseases].[dbo].[World_Health_Data]
		where Code=''
        Order By Entity;



		
		
		              --Filter the Data of any particular Country
       
	   Select * from [dbo].[World_Health_Data]
		where entity='Pakistan'

		SELECT *
        FROM [Deaths_and_Diseases].[dbo].[World_Health_Data]
		where Code not in('') and Entity not in ('world')
        Order By Entity;

		
		
		              --Sort out the Data with any specific alphabet , Hint or character
		
		--Starts with (Text)
		 Select * from [dbo].[World_Health_Data]   
		where entity like 'w%'
		
		--Comes in Center
		 Select * from [dbo].[World_Health_Data]
		where entity like '%S%'
		
		--Ends with
		Select * from [dbo].[World_Health_Data]
		where entity like '%S'

        --Ends with (NUMERIC)
		Select * from [dbo].[World_Health_Data]
		where [Nutritional deficiencies] like '%3'

		--Having this
		Select * from [dbo].[World_Health_Data]
		where [Nutritional deficiencies] like '%4%'


		--Starting with
		Select * from [dbo].[World_Health_Data]
		where [Nutritional deficiencies] like '3%'
         
		 
		 
		        --Country Data with Particular Year Or Years

				 Select * from [dbo].[World_Health_Data]
		where entity='Pakistan' and Year='1992'

				 Select * from [dbo].[World_Health_Data]
		where entity='Pakistan' and Year in ('2019' ,'1999')

		         Select [Malaria],entity ,year from [dbo].[World_Health_Data]
		where entity  in   ('Pakistan' ,'Afghanistan','Palestine') and Year='2000'

		       
		         Select entity,Year,[Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan'  and Year in ('1990','2000','2019')
		
				 
				
				        
						
					--Statistical analysis
				
				Select entity,year,Max(Cast([Environmental heat and cold exposure]as Int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity,year
		order by [Environmental heat and cold exposure] desc
		
		       
			   Select entity,sum(cast([Environmental heat and cold exposure]as int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan'
		group by entity
				
				
				Select entity,sum(cast([Environmental heat and cold exposure]as int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan' and Year in ('2021','1999','1992') 
		group by entity
	
		
		        Select entity,year,Min(Cast([Environmental heat and cold exposure]as Int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity,year
		order by [Environmental heat and cold exposure] 

		        Select entity,Count(Cast([Environmental heat and cold exposure]as Int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity
		         
				Select Count(entity) as [Total Countries] from [dbo].[World_Health_Data]
		where Code not in ('') and Entity not in ('world')


                 Select Entity, Count(entity) as [Total Entries] from [dbo].[World_Health_Data]
		where Code not in ('') and Entity not in ('world')
		Group by entity
		order by Entity


		         Select entity,Sum(Cast([Environmental heat and cold exposure]as Int)) as [Environmental heat and cold exposure] from [dbo].[World_Health_Data]
		 where Code not in ('') and Entity not in ('world')
		 Group by entity
		 order by  Entity

		         Select entity,Sum(Cast([World_Health_Data].[Malaria]as Int)/Cast([World_Health_Data].[Environmental heat and cold exposure]as int))as Total from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity
		 

		        Select entity,Sum(Cast([World_Health_Data].[Malaria]as Int)/Cast([World_Health_Data].[Environmental heat and cold exposure]as int))*100 as Total from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity

		        Select entity,Sum(Cast([World_Health_Data].[Malaria]as Int)-Cast([World_Health_Data].[Environmental heat and cold exposure]as int)) as Total from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity

               --Sum of more then one column
		
		       Select entity,Sum(Cast([World_Health_Data].[Environmental heat and cold exposure]as Int)+Cast([World_Health_Data].[Malaria]as int)) as Total from [dbo].[World_Health_Data]
		where entity='Pakistan'  
		Group by entity

		      Select Entity,Sum(Cast([World_Health_Data].[Environmental heat and cold exposure]as Int)+Cast([World_Health_Data].[Malaria]as int)) as Total from [dbo].[World_Health_Data]
		where Code not in ('') and Entity not in ('world')
		Group by Entity
		order by Total desc


		--Adding Total Deaths Of Each Year For Each Country
		
		SELECT  [Entity],Year,Code
      ,Sum(Cast([Meningitis]as int)
      +Cast([Alzheimer's disease and other dementias] as int)
      +Cast([Parkinson's disease]as int) 
      +Cast([Nutritional deficiencies]as Int)
      +Cast([Malaria]as Int) 
      +Cast([Drowning]as Int) 
      +Cast([Interpersonal violence]as Int) 
      +Cast([Maternal disorders]as Int)
      +Cast([HIV AIDS]as Int)
      +Cast([Drug use disorders]as Int) 
      +Cast([Tuberculosis]as Int)
      +Cast([Cardiovascular diseases]as Int)
      +Cast([Neonatal disorders]as Int)
      +Cast([Alcohol use disorders]as Int)
      +Cast([Self-harm]as Int)
      +Cast([Exposure to forces of nature]as Int) 
      +Cast([Diarrheal diseases]as Int) 
      +Cast([Environmental heat and cold exposure]as Int)
      +Cast([Neoplasms]as Int)
      +Cast([Conflict and terrorism]as Int) 
      +Cast([Diabetes mellitus]as Int)
      +Cast([Chronic kidney disease]as Int) 
      +Cast([Poisonings]as Int)
      +Cast([Road injuries]as Int)
      +Cast([Chronic respiratory diseases]as Int)
      +Cast([Cirrhosis and other chronic liver diseases]as Int)
      +Cast([Digestive diseases]as Int) 
      +Cast([Fire_Heat_HotSubstances]as Int) 
      +Cast([Acute_Hepatitis]as Int))as Total_Deatha
  FROM [Deaths_and_Diseases].[dbo].[World_Health_Data]
  where Code not in ('') and Entity not in ('world')
  Group by Entity,Year,Code
        Order By Entity;


            --CREATE VIEW 
			
	
		Create view TotalDeaths as
	   Select Entity,Year,
      Sum(Cast([Meningitis]as int)
      +Cast([Alzheimer's disease and other dementias] as int)
      +Cast([Parkinson's disease]as int) 
      +Cast([Nutritional deficiencies]as Int)
      +Cast([Malaria]as Int) 
      +Cast([Drowning]as Int) 
      +Cast([Interpersonal violence]as Int) 
      +Cast([Maternal disorders]as Int)
      +Cast([HIV AIDS]as Int)
      +Cast([Drug use disorders]as Int) 
      +Cast([Tuberculosis]as Int)
      +Cast([Cardiovascular diseases]as Int)
      +Cast([Neonatal disorders]as Int)
      +Cast([Alcohol use disorders]as Int)
      +Cast([Self-harm]as Int)
      +Cast([Exposure to forces of nature]as Int) 
      +Cast([Diarrheal diseases]as Int) 
      +Cast([Environmental heat and cold exposure]as Int)
      +Cast([Neoplasms]as Int)
      +Cast([Conflict and terrorism]as Int) 
      +Cast([Diabetes mellitus]as Int)
      +Cast([Chronic kidney disease]as Int) 
      +Cast([Poisonings]as Int)
      +Cast([Road injuries]as Int)
      +Cast([Chronic respiratory diseases]as Int)
      +Cast([Cirrhosis and other chronic liver diseases]as Int)
      +Cast([Digestive diseases]as Int) 
      +Cast([Fire_Heat_HotSubstances]as Int) 
      +Cast([Acute_Hepatitis]as Int))as Total_Deaths
  FROM [Deaths_and_Diseases].[dbo].[World_Health_Data]
  where Code not in ('') and Entity not in ('world')
  Group by Entity,Year

  Select * from [dbo].[TotalDeaths]

   Select Entity,Sum([Total_Deaths])as Total_Deaths from [dbo].[TotalDeaths]
   Group by Entity

      
	--  --USING JOINS
    
	Select Distinct
	   A.[Entity]
	  ,A.Year
      ,A.[Code]
      ,A.[Meningitis]
      ,A.[Alzheimer's disease and other dementias]
      ,A.[Parkinson's disease]
      ,A.[Nutritional deficiencies]
      ,A.[Malaria]
      ,A.[Drowning]
      ,A.[Interpersonal violence]
      ,A.[Maternal disorders]
      ,A.[HIV AIDS]
      ,A.[Drug use disorders]
      ,A.[Tuberculosis]
      ,A.[Cardiovascular diseases]
      ,A.[(No column name)]
      ,A.[Neonatal disorders]
      ,A.[Alcohol use disorders]
      ,A.[Self-harm]
      ,A.[Exposure to forces of nature]
      ,A.[Diarrheal diseases]
      ,A.[Environmental heat and cold exposure]
      ,A.[Neoplasms]
      ,A.[Conflict and terrorism]
      ,A.[Diabetes mellitus]
      ,A.[Chronic kidney disease]
      ,A.[Poisonings]
      ,A.[rotein-energy malnutrition]
      ,A.[Road injuries]
      ,A.[Chronic respiratory diseases]
      ,A.[Cirrhosis and other chronic liver diseases]
      ,A.[Digestive diseases]
      ,A.[Fire_Heat_HotSubstances]
      ,A.[Acute_Hepatitis]
	  ,B.Total_Deaths
	  From [dbo].[World_Health_Data] as A
        Join  [dbo].[TotalDeaths]  as B
	 on A.Entity=B.Entity 
	 and A.Year=B.Year
	 where Code not in ('') and A.Entity not in ('world')
	 
	

	--Create another view using Joins
	
	Create view MainData as
	Select Distinct
	   A.[Entity]
	  ,A.Year
      ,A.[Code]
      ,A.[Meningitis]
      ,A.[Alzheimer's disease and other dementias]
      ,A.[Parkinson's disease]
      ,A.[Nutritional deficiencies]
      ,A.[Malaria]
      ,A.[Drowning]
      ,A.[Interpersonal violence]
      ,A.[Maternal disorders]
      ,A.[HIV AIDS]
      ,A.[Drug use disorders]
      ,A.[Tuberculosis]
      ,A.[Cardiovascular diseases]
      ,A.[(No column name)]
      ,A.[Neonatal disorders]
      ,A.[Alcohol use disorders]
      ,A.[Self-harm]
      ,A.[Exposure to forces of nature]
      ,A.[Diarrheal diseases]
      ,A.[Environmental heat and cold exposure]
      ,A.[Neoplasms]
      ,A.[Conflict and terrorism]
      ,A.[Diabetes mellitus]
      ,A.[Chronic kidney disease]
      ,A.[Poisonings]
      ,A.[rotein-energy malnutrition]
      ,A.[Road injuries]
      ,A.[Chronic respiratory diseases]
      ,A.[Cirrhosis and other chronic liver diseases]
      ,A.[Digestive diseases]
      ,A.[Fire_Heat_HotSubstances]
      ,A.[Acute_Hepatitis]
	  ,B.Total_Deaths
	  From [dbo].[World_Health_Data] as A
        Join  [dbo].[TotalDeaths]  as B
	 on A.Entity=B.Entity 
	 and A.Year=B.Year
	 where Code not in ('') and A.Entity not in ('world')



	 Select * from MainData
	 where entity='Pakistan'


	 Select Sum(Total_Deaths) from [dbo].[MainData]
	 where Entity='Pakistan'




  

   
  
  