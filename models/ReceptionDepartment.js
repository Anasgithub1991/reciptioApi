const { notifyMessage } = require("../utils/notification");
const { pool, client } = require('../db/index')


const ReceptionDepartment = {}
ReceptionDepartment.all = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `SELECT * FROM public.reception_department;`

            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'ReceptionDepartment not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'ReceptionDepartment fetch successfuly', result.rows, ''))

            }
            )



        })
}

ReceptionDepartment.insert = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `INSERT INTO public.reception_department(id, reception_name)
                     VALUES (default, $1);`;

        const values = [body.reception_name];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionDepartment not posted successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionDepartment posted successfully', result.rows, ''));
        });
    });
};


ReceptionDepartment.update = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.reception_department
                     SET reception_name = $1
                     WHERE id = $2;`;

        const values = [body.reception_name, body.id];

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionDepartment not updated successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionDepartment updated successfully', result.rows, ''));
        });
    });
};



ReceptionDepartment.delete = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `DELETE FROM public.reception_department
                     WHERE id = $1;`;

        const values = [body];  // Assuming body is the ID of the department to delete

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'ReceptionDepartment not deleted successfully', '', error));
            return resolve(notifyMessage(true, 'ReceptionDepartment deleted successfully', result.rows, ''));
        });
    });
};

 
module.exports = ReceptionDepartment