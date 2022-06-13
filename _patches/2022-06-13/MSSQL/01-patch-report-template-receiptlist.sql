INSERT INTO sys_report_template (name, title, filepath, master, icon) 
VALUES ('receiptlist', 'Receipt List', 'reports/treasury/receipt/receiptlist.jasper', '0', NULL)
;

INSERT INTO sys_report_def (name, title, category, template, reportheader, role, sortorder, statement, permission, parameters, querytype, state, description, properties) 
VALUES ('receiptlist', 'Receipt List', 'reports/treasury', 'receiptlist', NULL, NULL, '1', 'SELECT TOP 50 objid, receiptno, receiptdate, paidby, amount,\n( ''qrcode:'' + receiptno ) AS qrcode\n FROM cashreceipt', NULL, '[]', 'SQL', 'DRAFT', NULL, '[]')
;

INSERT INTO sys_report_subreport_def (objid, parentid, reportid, name, querytype, statement) 
VALUES ('SUBRPT-61a424b5:1814b346812:-71fb', NULL, 'receiptlist', 'items', 'SQL', 'SELECT \n    objid,\n    item_code,\n    item_title,\n    amount,\n    remarks\nFROM cashreceiptitem WHERE receiptid = $P{objid}')
;
