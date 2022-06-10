
ALTER TABLE business ADD mainlobid varchar(50) NULL
go 


update aa set 
	aa.mainlobid = bb.mainlobid 
from 
	business aa, 
	( 
		SELECT
			 b.objid, 
			 (
				 SELECT TOP 1 lob_objid  
					FROM business_active_info
					WHERE businessid = b.objid  
						AND attribute_name IN ( 'CAPITAL', 'GROSS' )
						AND decimalvalue > 0 
					ORDER BY decimalvalue DESC 
			 ) AS mainlobid 
		FROM business b
		WHERE b.activeyear = 2022 
	)bb 
where 
	aa.objid = bb.objid 

go 
