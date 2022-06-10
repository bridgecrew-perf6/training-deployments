
ALTER TABLE business ADD mainlobid varchar(50) NULL
;


update 
	business aa, 
	( 
		SELECT
			 b.objid, 
			 (
				 SELECT lob_objid  
					FROM business_active_info
					WHERE businessid = b.objid  
						AND attribute_name IN ( 'CAPITAL', 'GROSS' )
						AND decimalvalue > 0 
					ORDER BY decimalvalue DESC LIMIT 1
			 ) AS mainlobid 
		FROM business b
		WHERE b.activeyear = 2022 
	)bb 
set
	aa.mainlobid = bb.mainlobid
where 
	aa.objid = bb.objid 
; 

