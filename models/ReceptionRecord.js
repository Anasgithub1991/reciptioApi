const { notifyMessage } = require("../utils/notification");
const { pool, client } = require('../db/index')


const ReceptionRecord = {}
ReceptionRecord.all = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `           SELECT  reception_record.*,province_name FROM public.reception_record
            left join public.province
            on public.reception_record.province_id=public.province.province_id
           
`
            console.log('sql', sql);

            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'ReceptionRecord not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'ReceptionRecord fetch successfuly', result.rows, ''))

            }
            )



        })
}



ReceptionRecord.id = (id, exit, page) => {


    return new Promise((resolve, reject) => {
        const sql = `SELECT r.*, province_name 
                     FROM public.reception_record r
                     LEFT JOIN public.province p
                     ON r."province_id" = p.province_id
                     WHERE r.reception_unit_id = $1 
                     AND r.exit = CAST($2 AS bit) 
                     ${page === '1' ? "" : "OR r.exit_transform = CAST($2 AS bit)"}
                     ORDER BY created_at DESC;`;

        const values = [id, exit];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord by id not fetched successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord by id fetched successfully', result.rows, ''));
        });
    });
};

ReceptionRecord.gettransform = (unit_id) => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * 
                     FROM public.reception_record r
                     INNER JOIN public.distination_transform dt 
                     ON dt.reception_id = r.id
                     WHERE dt.distination_transform = $1;`;

        const values = [unit_id];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'gettransform not fetched successfully', '', error));
            return resolve(notifyMessage(true, 'gettransform fetched successfully', result.rows, ''));
        });
    });
};


ReceptionRecord.insert = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `INSERT INTO public.reception_record
            (name, district, street, region, identitynum, created_at, purpos, phone, result, law_situation, arrested_num, notes, created_by, province_id, job_cat, date_out, house, destination_org_id, exit, reception_unit_id, exit_transform, date_out_transform,org_visitor)
            VALUES ($1, $2, $3, $4, $5, default, $6, $7, CAST($8 AS bit), $9, $10, $11, $12, $13, $14, null, $15, $16, default, $17, default, null,$18);`;

        const values = [
            body.name,
            body.district,
            body.street,
            body.region,
            body.identitynum,
            body.purpos,
            body.phone,
            body.result,
            body.law_situation,
            body.arrested_num,
            body.notes || null,
            body.created_by || null,
            body.province_id,
            body.job_cat,
            body.house,
            body.destination_org_id,
            body.unit_id,
            body.org_visitor
        ];

        console.log('sql', sql);
        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord not posted successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord posted successfully', result.rows, ''));
        });
    });
};
ReceptionRecord.distination_transform_insert = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `INSERT INTO public.distination_transform(
            id, distination_transform, report, reception_id)
            VALUES (default, $1, $2, $3);`;

        const values = [
            body.distination_transform || body.unit_id,
            body.report,
            body.id || null
        ];

        console.log('sql', sql);
        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord not posted successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord posted successfully', result.rows, ''));
        });
    });
};

ReceptionRecord.update = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.reception_record
            SET name = $1, district = $2, street = $3, region = $4, identitynum = $5,
            purpos = $6, phone = $7, result = CAST($8 AS bit), law_situation = $9, arrested_num = $10,
            notes = $11, created_by = $12, province_id = $13, job_cat = $14, house = $15,
            destination_org_id = $16, reception_unit_id = $17,org_visitor=$18
            WHERE id = $19;`;

        const values = [
            body.name,
            body.district,
            body.street,
            body.region,
            body.identitynum,
            body.purpos,
            body.phone,
            body.result,
            body.law_situation,
            body.arrested_num,
            body.notes || null,
            body.created_by || null,
            body.province_id,
            body.job_cat,
            body.house,
            body.destination_org_id || null,
            body.unit_id,
            body.org_visitor,
            body.id
        ];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord not updated successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord updated successfully', result.rows, ''));
        });
    });
};

ReceptionRecord.distination_transform_update = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.distination_transform
            SET distination_transform = $1, report = $2, reception_id = $3
            WHERE id = $4;`;

        const values = [
            body.destination_org_id,
            body.report,
            body.id,
            body.id
        ];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'distination_transform_update not updated successfully', '', error));
            return resolve(notifyMessage(true, 'distination_transform_update updated successfully', result.rows, ''));
        });
    });
};

ReceptionRecord.outdate = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.reception_record 
            SET date_out = now(), exit = CAST($1 AS bit)
            WHERE id = $2;`;

        const values = [
            body.exit,
            body.id
        ];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord not updated successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord updated successfully', result.rows, ''));
        });
    });
};

ReceptionRecord.outdateTransform = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.reception_record 
            SET date_out_transform = now(), exit_transform = CAST($1 AS bit)
            WHERE id = $2;`;

        const values = [
            body.exit,
            body.id
        ];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionRecord not updated successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionRecord updated successfully', result.rows, ''));
        });
    });
};



module.exports = ReceptionRecord