const { notifyMessage } = require("../utils/notification");
const { pool, client } = require('../db/index')


const DistinationTransform = {}

DistinationTransform.all = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `SELECT unit_id as  F_unit_id, unit_name as F_unit_name,
             unit_admin_level_id as F_unit_admin_level_id FROM public.workunits; `
            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'DistinationTransform not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'DistinationTransform fetch successfuly', result.rows, ''))

            }
            )



        })
}
DistinationTransform.onlineapply = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `select distinct(f.unit_id), f.unit_name || '/'|| workunits.unit_name as unit_name from  (SELECT * from  public.workunits ) as f inner join public.workunits 
            on public.workunits.unit_id=f.unit_parent_unit_id   
			inner join public.users u on u.unit_id=f.unit_id
             where f.unit_admin_level_id not in (99,94,93,91,90,88); `
            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'DistinationTransform not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'DistinationTransform fetch successfuly', result.rows, ''))

            }
            )



        })
}
DistinationTransform.transform = () => {
    return new Promise
        ((resolve, reject) => {

            const sql = `select distinct(f.unit_id), f.unit_name || '/'|| workunits.unit_name as unit_name from  (SELECT * from  public.workunits ) as f inner join public.workunits 
            on public.workunits.unit_id=f.unit_parent_unit_id inner join public.users on f.unit_id= public.users.unit_id
             where f.unit_admin_level_id not in (99,94,93,91,90,88)`
            console.log('sql', sql);
            console.log('result.rows');
            pool.query(sql, (error, result) => {

                if (error) return reject(notifyMessage(false, 'DistinationTransform transform not fetch successfuly', '', error))
                return resolve(notifyMessage(true, 'DistinationTransform transform fetch successfuly', result.rows, ''))

            }
            )



        })
}
 

DistinationTransform.id = (id) => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM public.unittree($1)`;

        const values = [id];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'DistinationTransform by id not fetched successfully', '', error));
            return resolve(notifyMessage(true, 'DistinationTransform by id fetched successfully', result.rows, ''));
        });
    });
};




DistinationTransform.gettransform = (unit_id) => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT r.*, dt.distination_transform, dt.report, dt.reception_id 
                     FROM public.reception_record r
                     INNER JOIN public.distination_transform dt 
                     ON dt.reception_id = r.id
                     WHERE dt.distination_transform = $1 
                     AND r.exit_transform = CAST(0 AS bit)
                     ORDER BY r.date_out_transform DESC;`;

        const values = [unit_id];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'gettransform not fetched successfully', '', error));
            return resolve(notifyMessage(true, 'gettransform fetched successfully', result.rows, ''));
        });
    });
};


DistinationTransform.insert = (body, reception_id) => {
    return new Promise((resolve, reject) => {
        const sql = `INSERT INTO public.distination_transform (id, distination_transform, report, reception_id)
                     VALUES (default, $1, $2, $3);`;

        const values = [body.distination_transform, body.report || null, reception_id];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'DistinationTransform not posted successfully', '', error));
            return resolve(notifyMessage(true, 'DistinationTransform posted successfully', result.rows, ''));
        });
    });
};


DistinationTransform.update = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `UPDATE public.distination_transform
                     SET name = $1
                     WHERE id = $2;`;

        const values = [body.name, body.id];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'DistinationTransform not updated successfully', '', error));
            return resolve(notifyMessage(true, 'DistinationTransform updated successfully', result.rows, ''));
        });
    });
};



DistinationTransform.delete = (body) => {
    return new Promise((resolve, reject) => {
        const sql = `DELETE FROM public.distination_transform WHERE id = $1;`;

        const values = [body];

        console.log('sql', sql);

        pool.query(sql, values, (error, result) => {
            if (error) return reject(notifyMessage(false, 'DistinationTransform not deleted successfully', '', error));
            return resolve(notifyMessage(true, 'DistinationTransform deleted successfully', result.rows, ''));
        });
    });
};


module.exports = DistinationTransform