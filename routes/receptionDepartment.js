const router = require('express').Router()
const ReceptionDepartment = require('../models/ReceptionDepartment')

const { notifyMessage } = require('../utils/notification')


router.get('/', async (req, res) => {
    try {
        let receptionDepartment = await ReceptionDepartment.all()
        res.status(200).json(receptionDepartment)

    } catch { res.status(400).json(notifyMessage(false, 'receptionDepartment was not fetch', '', error)) }
})
router.post('/', (async (req, res) => { 
    try { 
        let receptionDepartment = await ReceptionDepartment.insert(req.body) 
        res.status(200).json(receptionDepartment)
    } 
    catch(error)
     { 
res.status(400).json(notifyMessage(false, 'receptionDepartment was not post', '', error))
     } }))

     router.put('/', (async (req, res) => { 
        try { 
            console.log('req.body',req.body);
            let receptionDepartment = await ReceptionDepartment.update(req.body) 
            res.status(200).json(receptionDepartment)
        } 
        catch(error)
         { 
    res.status(400).json(notifyMessage(false, 'receptionDepartment was not put ', '', error))
         } }))

         router.delete('/id/:id', (async (req, res) => { 
            try { 
                let receptionDepartment = await ReceptionDepartment.delete(req.params.id) 
                res.status(200).json(receptionDepartment)
            } 
            catch(error)
             { 
        res.status(400).json(notifyMessage(false, 'receptionDepartment was not delete ', '', error))
             } }))
module.exports = router