const { notifyMessage } = require("../utils/notification");
const { pool, client } = require('../db/index')


const Province = {}
Province.all = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `SELECT * FROM public.province`
            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'province not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'province fetch successfuly', result.rows, ''))

            }
            )



        })
}

Province.insert = (body) => {
    return new Promise((resolve, reject) => {
        //CREATED BY NOT PROCESS
        //date_out NOT PROCESS
        let sql = `INSERT INTO public.province(province_name)
            VALUES ('${body.province_name}');`
        console.log('sql', sql);
        pool.query(sql, (error, result) => {
            if (error) return (reject(notifyMessage(false, 'province not post successfuly', '', error)))
            return (resolve(notifyMessage(true, 'province post successfuly', result.rows, '')))
        })
    })
}
Province.update = (body) => {
    return new Promise((resolve, reject) => {
        let sql = `UPDATE public.province_name SET province_name='${body.province_name}' WHERE id=${body.id};`
        console.log('sql', sql);

        pool.query(sql, (error, result) => {
            if (error) return (reject(notifyMessage(false, 'province_name not update successfuly', '', error)))
            return (resolve(notifyMessage(true, 'province_name update successfuly', result.rows, '')))
        })
    })
}

Province.delete = (body) => {
    return new Promise((resolve, reject) => {
        let sql = `DELETE FROM public.province WHERE province_id=${body};`
        console.log('sql', sql);

        pool.query(sql, (error, result) => {
            if (error) return (reject(notifyMessage(false, 'province not delete successfuly', '', error)))
            return (resolve(notifyMessage(true, 'province delete successfuly', result.rows, '')))
        })
    })
}

module.exports = Province