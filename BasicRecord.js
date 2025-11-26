// const request = require('../connection/sqlServer')
const pool = require('../connection/mysql')
require('dotenv/config')
const { notifyMessage } = require('../utils/notification')
const dayjs = require('dayjs')
const moment = require('moment')
//define object  
let BasicRecord = {}

//get all tblbasicrecords  data filter id
BasicRecord.analogIdSeq_validation = (body) => {
    return new Promise((resolve, reject) => {
        // Use placeholders in the SQL query
        let sql = `
            SELECT COUNT(id) AS count 
            FROM policerecord.basicrecords br 
            WHERE YEAR(br.eventDatetime) = ? 
            AND br.analogID = ? 
            AND br.stationID = ?;
        `;

        // Values to replace placeholders
        const values = [body.eventDatetime, body.analogID, body.stationID];

        // console.log('sql_count_analog_sequance', sql);

        // Use the parameterized query
        pool.query(sql, values, (err, result) => {
            if (err) {
                return reject(notifyMessage(false, 'Error fetching tblbasicrecords', '', err));
            }
            resolve(notifyMessage(true, 'tblbasicrecords was fetched successfully', result, ''));
        });
    });
}

BasicRecord.byID = (id) => {
    return new Promise((resolve, reject) => {
        // Use a parameterized query
        const sql = `SELECT * FROM basicrecords WHERE basicrecordsID = ?;`;

        console.log('sql_byID', sql);

        // Use the parameterized query with the id value
        pool.query(sql, [id], (err, result) => {
            if (err) {
                return reject(notifyMessage(false, 'Error fetching tblbasicrecords by ID', '', err));
            }
            resolve(notifyMessage(true, 'tblbasicrecords was fetched successfully by ID', result, ''));
        });
    });
}


//get all tblbasicrecords  data filter by station 
BasicRecord.bystation = (id) => {
    return new Promise((resolve, reject) => {
        // Use a parameterized query
        const sql = `SELECT * FROM basicrecords WHERE stationID = ?;`;

        // console.log('sql_bystation', sql);

        // Use the parameterized query with the id value
        pool.query(sql, [id], (err, result) => {
            if (err) {
                return reject(notifyMessage(false, 'Error fetching tblbasicrecords by station ID', '', err));
            }
            resolve(notifyMessage(true, 'tblbasicrecords was fetched successfully by station ID', result, ''));
        });
    });
}

//get all tblbasicrecords  data filter by station 
BasicRecord.search = (body) => {
    return new Promise((resolve, reject) => {
        // Build the base SQL query
        let sql = `
            SELECT * FROM (
                SELECT  br.analogID,br.analogDate,br.eventDatetime,br.created_at,br.dailyRecordRefNo,br.gravityCrimeCodeID,br.eventLocCode,br.eventLocText,br.deathsNo,br.injuredNo,br.id,br.audit,br.crimeDetected,br.legalMatterID,br.legaltype,br.governID,
                   (SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        al.accused_firstname, 
                        al.accused_secondname, 
                        al.accused_thirdname, 
                        al.accused_forthname, 
                        al.accused_surname, 
                        al.accused_nakename
                    ) SEPARATOR ',') 
 FROM policerecord.accusedlist al 
 WHERE al.basicRecordsID = br.id) AS accusedFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        com.complaintName1, 
                        com.complaintName2, 
                        com.complaintName3, 
                        com.complaintName4, 
                        com.complaintSurename
                    ) SEPARATOR ',') 
 FROM policerecord.complainer com 
 WHERE com.basicrecordsID = br.id) AS complaintFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        dl.detectivename1, 
                        dl.detectivename2, 
                        dl.detectivename3, 
                        dl.detectivename4
                    ) SEPARATOR ',') 
 FROM policerecord.detectivelist dl 
 WHERE dl.basicRecordID = br.id) AS detectivefullname,
                    CASE WHEN br.crimeDetected = 1 THEN 'مكتشفة' ELSE 'غير مكتشفة' END AS crimeDetectedtext,
                    
                    (SELECT number FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID) AS number,
                    
                    (SELECT value FROM policerecord.legaldescribetypes ldt WHERE ldt.id IN 
                        (SELECT legalDescribeID FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID)
                    ) AS legaldescribe,
                    
                    (SELECT value FROM policerecord.commands c WHERE c.id = br.commandID) AS command,
                    
                    (SELECT value FROM policerecord.department d WHERE d.id = br.departmentID) AS department,
                    
                    (SELECT value FROM policerecord.stations s WHERE s.id = br.stationID) AS stations
                    
                 FROM policerecord.basicrecords br
                ${body.userLevel == 1 ? `` : body.userLevel == 2 ?
                `WHERE br.commandID = ?` : `WHERE br.stationID = ? AND br.departmentID = ?`}
                GROUP BY br.id
            ) br
            WHERE CONCAT_WS(' ', br.analogID, br.legaldescribe, br.crimeDetected, br.complaintFullname, br.accusedFullname, br.detectivefullname) LIKE ?
            ORDER BY br.eventDatetime DESC
            LIMIT 200;`;

        // Define the parameters to replace the placeholders
        let params = [];
        if (body.userLevel == 2) {
            params.push(body.commandID);
        } else if (body.userLevel > 2) {
            params.push(body.stationID, body.departmentID);
        }
        // Add the search parameter, ensuring to use wildcards
        params.push(`%${body.search}%`);

        // console.log('sql', sql);
        // console.log('params', params);

        // Execute the query with parameters
        pool.query(sql, params, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tblbasicrecords search fetched successfully', '', err));
            resolve(notifyMessage(true, 'tblbasicrecords was search fetched successfully', result, ''));
        });
    });
}

BasicRecord.search_costume = (body) => {
    // console.log('body', body);
    return new Promise((resolve, reject) => {
        // Base SQL query
        let sql = `
            SELECT * FROM (
                SELECT  br.analogID,br.analogDate,br.eventDatetime,br.created_at,br.dailyRecordRefNo,br.gravityCrimeCodeID,br.eventLocCode,br.eventLocText,br.deathsNo,br.injuredNo,br.id,br.audit,br.crimeDetected,br.legalMatterID,br.legaltype,br.governID,
                     (SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        al.accused_firstname, 
                        al.accused_secondname, 
                        al.accused_thirdname, 
                        al.accused_forthname, 
                        al.accused_surname, 
                        al.accused_nakename
                    ) SEPARATOR ',') 
 FROM policerecord.accusedlist al 
 WHERE al.basicRecordsID = br.id) AS accusedFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        com.complaintName1, 
                        com.complaintName2, 
                        com.complaintName3, 
                        com.complaintName4, 
                        com.complaintSurename
                    ) SEPARATOR ',') 
 FROM policerecord.complainer com 
 WHERE com.basicrecordsID = br.id) AS complaintFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        dl.detectivename1, 
                        dl.detectivename2, 
                        dl.detectivename3, 
                        dl.detectivename4
                    ) SEPARATOR ',') 
 FROM policerecord.detectivelist dl 
 WHERE dl.basicRecordID = br.id) AS detectivefullname,
                    CASE WHEN br.crimeDetected = 1 THEN 'مكتشفة' ELSE 'غير مكتشفة' END AS crimeDetectedtext,
                    
                    (SELECT number FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID) AS number,
                    
                    (SELECT value FROM policerecord.legaldescribetypes ldt WHERE ldt.id IN 
                        (SELECT legalDescribeID FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID)
                    ) AS legaldescribe,
                    
                    (SELECT value FROM policerecord.commands c WHERE c.id = br.commandID) AS command,
                    
                    (SELECT value FROM policerecord.department d WHERE d.id = br.departmentID) AS department,
                    
                    (SELECT value FROM policerecord.stations s WHERE s.id = br.stationID) AS stations
                    
                 FROM policerecord.basicrecords br
                ${(!body.stationID && !body.departmentID && !body.commandID && body.userLevel === 1) ? `` :
                (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel != 4) ? `WHERE br.commandID = ?` :
                    (body.stationID == null && body.departmentID && body.commandID && body.userLevel != 4) ? `WHERE br.departmentID = ? AND br.commandID = ?` :
                        `WHERE br.stationID = ? AND br.departmentID = ? AND br.commandID = ?`}
                GROUP BY br.id
            ) br
                    ${(body.search == 'null' && body.search_analogid == 'null') ? `where date(br.eventDatetime) between ? AND ?` :
                (body.search && body.search_analogid == 'null') ? `WHERE CONCAT_WS(' ', br.detectivefullname, br.complaintFullname, br.legaldescribe, br.accusedFullname) LIKE ? and date(br.eventDatetime) between ? AND ?` :
                    (body.search == 'null' && body.search_analogid) ? `WHERE br.analogID = ? and date(br.eventDatetime) between ? AND ?` :
                        `WHERE CONCAT_WS(' ', br.legaldescribe, br.complaintFullname, br.accusedFullname, br.detectivefullname) LIKE ? AND br.analogID = ?  and date(br.eventDatetime) between ? AND ?`}
            ORDER BY br.eventDatetime DESC
            ${body.limit == '1' ? '' : 'LIMIT ? '}
        `;

        // Define parameters for placeholders
        let params = [];

        if (body.stationID || body.departmentID || body.commandID) {
            if (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel != 4) {
                params.push(body.commandID);
            } else if (body.stationID == null && body.departmentID && body.commandID && body.userLevel != 4) {
                params.push(body.departmentID, body.commandID);
            } else {
                params.push(body.stationID, body.departmentID, body.commandID);
            }
        }

        if (body.search == 'null' && body.search_analogid == 'null') {

            params.push(body.startDate, body.endDate, parseInt(body.moreData));

        }

        else if (body.search == 'null' && body.search_analogid) {
            params.push(body.search_analogid, body.startDate, body.endDate, parseInt(body.moreData));
        }
        else if (body.search && body.search_analogid == 'null') {
            params.push(`%${body.search}%`, body.startDate, body.endDate, parseInt(body.moreData));
        }
        else {
            params.push(`%${body.search}%`, body.search_analogid, body.startDate, body.endDate, parseInt(body.moreData));
        }



        // console.log('sql_search_costumelimit', body.limit == '1');
        // console.log('sql_search_costume', sql);
        // console.log('params', params);

        // Execute the query with parameters
        pool.query(sql, params, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tbltblbasicrecords search_search_costume fetched successfully', '', err));
            resolve(notifyMessage(true, 'tblbasicrecords was search_search_costume fetched successfully', result, ''));
        });
    });
}


BasicRecord.search_costume_withoutdate = (body) => {
    // console.log('body', body);
    return new Promise((resolve, reject) => {
        // Base SQL query
        let sql = `
            SELECT * FROM (
                SELECT  br.analogID,br.analogDate,br.eventDatetime,br.created_at,br.dailyRecordRefNo,br.gravityCrimeCodeID,br.eventLocCode,br.eventLocText,br.deathsNo,br.injuredNo,br.id,br.audit,br.crimeDetected,br.legalMatterID,br.legaltype,br.governID,
                    (SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        al.accused_firstname, 
                        al.accused_secondname, 
                        al.accused_thirdname, 
                        al.accused_forthname, 
                        al.accused_surname, 
                        al.accused_nakename
                    ) SEPARATOR ',') 
 FROM policerecord.accusedlist al 
 WHERE al.basicRecordsID = br.id) AS accusedFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        com.complaintName1, 
                        com.complaintName2, 
                        com.complaintName3, 
                        com.complaintName4, 
                        com.complaintSurename
                    ) SEPARATOR ',') 
 FROM policerecord.complainer com 
 WHERE com.basicrecordsID = br.id) AS complaintFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        dl.detectivename1, 
                        dl.detectivename2, 
                        dl.detectivename3, 
                        dl.detectivename4
                    ) SEPARATOR ',') 
 FROM policerecord.detectivelist dl 
 WHERE dl.basicRecordID = br.id) AS detectivefullname,
                    
                    CASE WHEN br.crimeDetected = 1 THEN 'مكتشفة' ELSE 'غير مكتشفة' END AS crimeDetectedtext,
                    
                    (SELECT number FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID) AS number,
                    
                    (SELECT value FROM policerecord.legaldescribetypes ldt WHERE ldt.id IN 
                        (SELECT legalDescribeID FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID)
                    ) AS legaldescribe,
                    
                    (SELECT value FROM policerecord.commands c WHERE c.id = br.commandID) AS command,
                    
                    (SELECT value FROM policerecord.department d WHERE d.id = br.departmentID) AS department,
                    
                    (SELECT value FROM policerecord.stations s WHERE s.id = br.stationID) AS stations
                    
                 FROM policerecord.basicrecords br
                ${(!body.stationID && !body.departmentID && !body.commandID && body.userLevel === 1) ? `` :
                (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) ? `WHERE br.commandID = ?` :
                    (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) ? `WHERE br.departmentID = ? AND br.commandID = ?` :
                        `WHERE br.stationID = ? AND br.departmentID = ? AND br.commandID = ?`}
                GROUP BY br.id
            ) br
                 ${(body.search == 'null' && body.search_analogid == 'null') ? `` :
                (body.search && body.search_analogid == 'null') ? `WHERE CONCAT_WS(' ', br.detectivefullname, br.complaintFullname, br.legaldescribe, br.accusedFullname) LIKE ?` :
                    (body.search == 'null' && body.search_analogid) ? `WHERE br.analogID = ?` :
                        `WHERE CONCAT_WS(' ', br.legaldescribe, br.complaintFullname, br.accusedFullname, br.detectivefullname) LIKE ? AND br.analogID = ?`}
            ORDER BY br.eventDatetime DESC
            ${body.limit == '1' ? '' : 'LIMIT ? '}
        `;

        // Define parameters for placeholders
        let params = [];

        if (body.stationID || body.departmentID || body.commandID) {
            if (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) {
                params.push(body.commandID);
            } else if (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) {
                params.push(body.departmentID, body.commandID);
            } else {
                params.push(body.stationID, body.departmentID, body.commandID);
            }
        }

        if (body.search == 'null' && body.search_analogid == 'null') {

            params.push(parseInt(body.moreData));

        }

        else if (body.search == 'null' && body.search_analogid) {
            params.push(body.search_analogid, parseInt(body.moreData));
        }
        else if (body.search && body.search_analogid == 'null') {
            params.push(`%${body.search}%`, parseInt(body.moreData));
        }
        else {
            params.push(`%${body.search}%`, body.search_analogid, parseInt(body.moreData));
        }


        // console.log('sql_search_costumewithoutdate', sql);
        // console.log('params', params);

        // Execute the query with parameters
        pool.query(sql, params, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tbltblbasicrecords search_search_costume fetched successfully', '', err));
            resolve(notifyMessage(true, 'tblbasicrecords was search_search_costume fetched successfully', result, ''));
        });
    });
}

BasicRecord.count_search_costume = (body) => {
    // console.log('body', body);
    return new Promise((resolve, reject) => {
        // Base SQL query
        let sql = `
            SELECT COUNT(id) AS count FROM (
                SELECT  br.analogID,br.eventDatetime,br.created_at,br.dailyRecordRefNo,br.gravityCrimeCodeID,br.eventLocCode,br.eventLocText,br.deathsNo,br.injuredNo,br.id,br.audit,br.crimeDetected,br.legalMatterID,br.legaltype,br.governID,

                  (SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        al.accused_firstname, 
                        al.accused_secondname, 
                        al.accused_thirdname, 
                        al.accused_forthname, 
                        al.accused_surname, 
                        al.accused_nakename
                    ) SEPARATOR ',') 
 FROM policerecord.accusedlist al 
 WHERE al.basicRecordsID = br.id) AS accusedFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        com.complaintName1, 
                        com.complaintName2, 
                        com.complaintName3, 
                        com.complaintName4, 
                        com.complaintSurename
                    ) SEPARATOR ',') 
 FROM policerecord.complainer com 
 WHERE com.basicrecordsID = br.id) AS complaintFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        dl.detectivename1, 
                        dl.detectivename2, 
                        dl.detectivename3, 
                        dl.detectivename4
                    ) SEPARATOR ',') 
 FROM policerecord.detectivelist dl 
 WHERE dl.basicRecordID = br.id) AS detectivefullname,
                    
                    CASE WHEN br.crimeDetected = 1 THEN 'مكتشفة' ELSE 'غير مكتشفة' END AS crimeDetectedtext,
                    
                    (SELECT number FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID) AS number,
                    
                    (SELECT value FROM policerecord.legaldescribetypes ldt WHERE ldt.id IN 
                        (SELECT legalDescribeID FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID)
                    ) AS legaldescribe,
                    
                    (SELECT value FROM policerecord.commands c WHERE c.id = br.commandID) AS command,
                    
                    (SELECT value FROM policerecord.department d WHERE d.id = br.departmentID) AS department,
                    
                    (SELECT value FROM policerecord.stations s WHERE s.id = br.stationID) AS stations
                    
                 FROM policerecord.basicrecords br
                ${(!body.stationID && !body.departmentID && !body.commandID && body.userLevel === 1) ? `` :
                (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) ? `WHERE br.commandID = ?` :
                    (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) ? `WHERE br.departmentID = ? AND br.commandID = ?` :
                        `WHERE br.stationID = ? AND br.departmentID = ? AND br.commandID = ?`}
                GROUP BY br.id
            ) br
        ${(body.search == 'null' && body.search_analogid == 'null') ? `where date(br.eventDatetime) between ? AND ?` :
                (body.search && body.search_analogid == 'null') ? `WHERE CONCAT_WS(' ', br.detectivefullname, br.complaintFullname, br.legaldescribe, br.accusedFullname) LIKE ? and date(br.eventDatetime) between ? AND ?` :
                    (body.search == 'null' && body.search_analogid) ? `WHERE br.analogID = ? and date(br.eventDatetime) between ? AND ?` :
                        `WHERE CONCAT_WS(' ', br.legaldescribe, br.complaintFullname, br.accusedFullname, br.detectivefullname) LIKE ? AND br.analogID = ?  and date(br.eventDatetime) between ? AND ?`}`;

        // Prepare parameters for placeholders
        let params = [];

        // Add parameters based on conditions
        if (body.stationID || body.departmentID || body.commandID) {
            if (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) {
                params.push(body.commandID);
            } else if (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) {
                params.push(body.departmentID, body.commandID);
            } else {
                params.push(body.stationID, body.departmentID, body.commandID);
            }
        }

        if (body.search == 'null' && body.search_analogid == 'null') {

            params.push(body.startDate, body.endDate);

        }

        else if (body.search == 'null' && body.search_analogid) {
            params.push(body.search_analogid, body.startDate, body.endDate);
        }
        else if (body.search && body.search_analogid == 'null') {
            params.push(`%${body.search}%`, body.startDate, body.endDate);
        }
        else {
            params.push(`%${body.search}%`, body.search_analogid, body.startDate, body.endDate);
        }

        // console.log('count_sql_search_costume', sql);
        // console.log('params', params);

        // Execute the query with parameters
        pool.query(sql, params, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tbltblbasicrecords search_search_costume fetched successfully', '', err));
            resolve(notifyMessage(true, 'tblbasicrecords was search_search_costume fetched successfully', result, ''));
        });
    });
}


BasicRecord.count_search_costume_withoutdate = (body) => {
    // console.log('body', body);
    return new Promise((resolve, reject) => {
        let sql = `
            SELECT COUNT(id) AS count FROM (
                SELECT  br.analogID,br.eventDatetime,br.created_at,br.dailyRecordRefNo,br.gravityCrimeCodeID,br.eventLocCode,br.eventLocText,br.deathsNo,br.injuredNo,br.id,br.audit,br.crimeDetected,br.legalMatterID,br.legaltype,br.governID,
                   (SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        al.accused_firstname, 
                        al.accused_secondname, 
                        al.accused_thirdname, 
                        al.accused_forthname, 
                        al.accused_surname, 
                        al.accused_nakename
                    ) SEPARATOR ',') 
 FROM policerecord.accusedlist al 
 WHERE al.basicRecordsID = br.id) AS accusedFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        com.complaintName1, 
                        com.complaintName2, 
                        com.complaintName3, 
                        com.complaintName4, 
                        com.complaintSurename
                    ) SEPARATOR ',') 
 FROM policerecord.complainer com 
 WHERE com.basicrecordsID = br.id) AS complaintFullname,
                    
(SELECT GROUP_CONCAT(CONCAT_WS(' ', 
                        dl.detectivename1, 
                        dl.detectivename2, 
                        dl.detectivename3, 
                        dl.detectivename4
                    ) SEPARATOR ',') 
 FROM policerecord.detectivelist dl 
 WHERE dl.basicRecordID = br.id) AS detectivefullname,

                    CASE WHEN br.crimeDetected = 1 THEN 'مكتشفة' ELSE 'غير مكتشفة' END AS crimeDetectedtext,

                    (SELECT number FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID) AS number,
                    (SELECT value FROM policerecord.legaldescribetypes ldt WHERE ldt.id IN 
                        (SELECT legalDescribeID FROM policerecord.legalmatters lm WHERE lm.id = br.legalMatterID)
                    ) AS legaldescribe,
                    (SELECT value FROM policerecord.commands c WHERE c.id = br.commandID) AS command,
                    (SELECT value FROM policerecord.department d WHERE d.id = br.departmentID) AS department,
                    (SELECT value FROM policerecord.stations s WHERE s.id = br.stationID) AS stations
                 FROM policerecord.basicrecords br
                ${(!body.stationID && !body.departmentID && !body.commandID && body.userLevel === 1) ? `` :
                (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) ? `WHERE br.commandID = ?` :
                    (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) ? `WHERE br.departmentID = ? AND br.commandID = ?` :
                        `WHERE br.stationID = ? AND br.departmentID = ? AND br.commandID = ?`}
                GROUP BY br.id
            ) br
            ${(body.search == 'null' && body.search_analogid == 'null') ? `` :
                (body.search && body.search_analogid == 'null') ? `WHERE CONCAT_WS(' ', br.detectivefullname, br.complaintFullname, br.legaldescribe, br.accusedFullname) LIKE ?` :
                    (body.search == 'null' && body.search_analogid) ? `WHERE br.analogID = ?` :
                        `WHERE CONCAT_WS(' ', br.legaldescribe, br.complaintFullname, br.accusedFullname, br.detectivefullname) LIKE ? AND br.analogID = ?`}
        `;

        // Prepare parameters for placeholders
        let params = [];

        // Add parameters based on conditions
        if (body.stationID || body.departmentID || body.commandID) {
            if (body.stationID == null && body.departmentID == null && body.commandID && body.userLevel !== 4) {
                params.push(body.commandID);
            } else if (body.stationID == null && body.departmentID && body.commandID && body.userLevel !== 4) {
                params.push(body.departmentID, body.commandID);
            } else {
                params.push(body.stationID, body.departmentID, body.commandID);
            }
        }

        if (body.search && body.search_analogid == 'null') {

            params.push(`%${body.search}%`);

        }
        else if (body.search == 'null' && body.search_analogid) {
            params.push(body.search_analogid);
        }
        else if (body.search && body.search_analogid) { params.push(`%${body.search}%`, body.search_analogid); }
        // console.log('count_sql_search_costume_withoutdate', sql);
        // console.log('params', params);

        // Execute the query with parameters
        pool.query(sql, params, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tbltblbasicrecords search_search_costume fetched successfully', '', err));
            resolve(notifyMessage(true, 'tblbasicrecords was search_search_costume fetched successfully', result, ''));
        });
    });
}

//get all tblbasicrecords  data
BasicRecord.All = () => {
    return new Promise((resolve, reject) => {
        pool.query(`select * from basicrecords;`, (err, result) => {
            if (err) return reject(notifyMessage(false, 'tblbasicrecords fetched successfuly', '', err))
            resolve(notifyMessage(true, 'tblbasicrecords was fetched successfuly', result, ''))

        })
    })
}
BasicRecord.insert = (body) => {
    return new Promise((resolve, reject) => {
        // console.log('basicrecordsbody', body);

        const sql = `INSERT INTO policerecord.basicrecords 
        (analogID, digitalID, crimeCardNo, dailyRecordRefNo, eventDatetime, governID, commandID, departmentID, stationID, legalMatterID,
         crimeDetected, eventLocCode, eventLocText, deathsNo, injuredNo, notes, 
         created_at, created_by, archiverName,
          archiveAuditor, gravityCrimeCodeID, legaltype,analogDate,agency)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, default, ?, ?, ?, ?, ?,?,?)`;

        const values = [
            body.analogID || null,
            1, // Assuming this is a constant value
            body.crimeCardNo || null,
            body.dailyRecordRefNo || null,
            body.eventDatetime ? body.eventDatetime : null,
            body.governID || null,
            body.commandID,
            body.departmentID,
            body.stationID,
            body.legalMatterID || null,
            body.crimeDetected,
            body.eventLocCode || null,
            body.eventLocText,
            body.deathsNo || 0,
            body.injuredNo || 0,
            body.notes || null,
            body.create_by,
            body.archiverName || null,
            body.archiveAuditor || null,
            body.gravityCrimeCodeID || null,
            body.legaltype || null,
            body.analogDate || null,
            body.agency || 1,  // This ensures that if body.agency is null or undefined, 1 is used instead.

        ];

        // console.log('sql', sql);
        pool.query(sql, values, (err, result) => {
            // console.log('result', result);
            if (err) {
                return reject(notifyMessage(false, 'tblbasicrecords not inserted successfully', '', err));
            }
            return resolve(notifyMessage(true, "tblbasicrecords inserted successfully", result, ''));
        });
    });
}


BasicRecord.update = (body) => {
    return new Promise((resolve, reject) => {
        // console.log('body_BasicRecord', body);

        const sql = `UPDATE policerecord.basicrecords SET
            analogID = ?,
            crimeCardNo = ?,
            dailyRecordRefNo = ?,
            eventDatetime = ?,
            governID = ?,
            legalMatterID = ?,
            crimeDetected = ?,
            eventLocCode = ?,
            eventLocText = ?,
            deathsNo = ?,
            injuredNo = ?,
            notes = ?,
            archiverName = ?,
            archiveAuditor = ?,
            gravityCrimeCodeID = ?,
            legaltype = ?,
            analogDate=?
        WHERE id = ?`;

        const values = [
            body.analogID || null,
            body.crimeCardNo || null,
            body.dailyRecordRefNo || null,
            dayjs(body.eventDatetime).isValid() ? dayjs(body.eventDatetime).format('YYYY-MM-DD HH:mm:ss') : null,
            body.governID || null,
            body.legalMatterID || null,
            body.crimeDetected,
            body.eventLocCode || null,
            body.eventLocText || null,
            body.deathsNo || 0,
            body.injuredNo || 0,
            body.notes || null,
            body.archiverName || null,
            body.archiveAuditor || null,
            body.gravityCrimeCodeID || null,
            body.legaltype || null,
            dayjs(body.analogDate).isValid() ? dayjs(body.analogDate).format('YYYY-MM-DD') : null,
            body.id
        ];

        console.log('sql_basicrecords', sql, values);
        pool.query(sql, values, (err, result) => {
            if (err) {
                return reject(notifyMessage(false, 'tblexisting not updated successfully', '', err));
            }
            return resolve(notifyMessage(true, "tblexisting updated successfully", result, {}));
        });
    });
}

// BasicRecord.delete = (id) => {
//     return new Promise((resolve, reject) => {
//         let sql = `delete from basicrecords where id =${id}`

//         pool.query(sql, (err, result) => {
//             if (err) return reject(notifyMessage(false, 'tbltblbasicrecords was not deleted', '', err))
//             return resolve(notifyMessage(true, "tblbasicrecords delete successfully", result, {}));
//         })
//     })
// }
BasicRecord.updateAudit = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE policerecord.basicrecords SET
            audit = ?,
            audit_num = audit_num + 1,
            audit_last_date = ?
        WHERE id = ?`;

        const values = [
            true,
            moment().format('YYYY-MM-DD'),
            body.id
        ];

        // console.log('sql_audit', sql);
        pool.query(sql, values, (err, result) => {
            if (err) {
                return reject(notifyMessage(false, 'tblbasicrecords was not updated for audit', '', err));
            }
            return resolve(notifyMessage(true, "tblbasicrecords updated audit successfully", result, {}));
        });
    });
}


module.exports = BasicRecord