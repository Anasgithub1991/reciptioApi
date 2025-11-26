const { notifyMessage } = require('../utils/notification')
const { pool, client } = require('../db/index')
const { poolPublic } = require('../db/index')

const Dashpoard = {}

Dashpoard.count = () => {
    return new Promise((resolve, reject) => {

        let sql = `SELECT( select  count(*)
        FROM public.reception_record
        where reception_unit_id =462) as totalreviewers,
        ( SELECT COUNT(*)
    FROM public.reception_record
    WHERE reception_unit_id = 462 AND EXTRACT(MONTH FROM created_at) = EXTRACT(MONTH FROM CURRENT_DATE) ) as totalreviewersinmonth
     ,
     ( SELECT COUNT(*)
    FROM public.reception_record
    WHERE reception_unit_id = 462 AND EXTRACT(DAY FROM created_at) = EXTRACT(DAY FROM CURRENT_DATE) ) as totalreviewersinday `
        pool.query(sql, (error, result) => {

            if (error) return reject(notifyMessage(false, "count not get successfly", '', error))
            return resolve(notifyMessage(true, 'count  Get successfly', result.rows, ''))

        })
    })
}




// Dashpoard.countOnline=()=>{return new  Promise((resolve,reject)=>{

//     let sql =`SELECT count(*) as onlinCount FROM requests_details;`
//     poolPublic.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"onlinCount Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'onlinCount  Get Successfly',result.rows,''))

//     })
// })}
// Dashpoard.countPrint=(id)=>{return new  Promise((resolve,reject)=>{

//     let sql =`SELECT count (*) as printcount FROM identification where is_print=true
// 	`
//    pool.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"printcount Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'printcount  Get Successfly',result.rows,''))

//     })
// })}
// Dashpoard.completed=(id)=>{return new  Promise((resolve,reject)=>{

//     let sql =`SELECT count (*) as count_completed FROM requests_details where 	 completed=1
// 	`
//    pool.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"count_completed Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'count_completed  Get Successfly',result.rows,''))

//     })
// })}
// Dashpoard.notcompleted=(id)=>{return new  Promise((resolve,reject)=>{

//     let sql =`SELECT count (*) as notcount_completed FROM requests_details  where 	 completed=0
// 	`
//    pool.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"notcount_completed Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'notcount_completed  Get Successfly',result.rows,''))

//     })
// })}

// Dashpoard.handleProcess=(id)=>{return new  Promise((resolve,reject)=>{

//     let sql =`
//     SELECT count (*) as handale_process FROM requests_details where 	 approval_num  is  NULL and approval_date  is  NULL 
// 	`
//    pool.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"handale_process Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'handale_process  Get Successfly',result.rows,''))

//     })
// })}
// Dashpoard.notHandleProcess=(id)=>{return new  Promise((resolve,reject)=>{

//     let sql =`
//     SELECT count (*) as nothandale_process FROM requests_details where 	 approval_num  is not NULL and approval_date  is not NULL 
// 	`
//    pool.query(sql,(error,result)=>{

//         if(error) return reject(notifyMessage(false,"notHandale_process Not Get Successfly",'',error))
//         return resolve(notifyMessage(true,'notHandale_process  Get Successfly',result.rows,''))

//     })
// })}









module.exports = Dashpoard