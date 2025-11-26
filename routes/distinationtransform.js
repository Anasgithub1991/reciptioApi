const router = require('express').Router()
const DistinationTransform = require('../models/DistinationTransform')
const { verifyToken } = require("../auth/jwt");

const { notifyMessage } = require('../utils/notification')

router.get('/', async (req, res) => {
    const getPaylod = verifyToken(req);

    const payload = getPaylod.msg
    try {
        console.log('weeetop')

        if (payload.roles?.sysadmin) {
            let distinationtransform = await DistinationTransform.all()
            res.status(200).json(distinationtransform)

        }
        else {
            console.log('payload', payload)
            let distinationtransform = await DistinationTransform.id(payload.unit_id)
            res.status(200).json(distinationtransform)

        }


    } catch (error) { res.status(400).json(notifyMessage(false, 'distinationtransform was not fetch', '', error)) }
})
router.get('/onlineapply', async (req, res) => {
    const getPaylod = verifyToken(req);

    try {

        let distinationtransform = await DistinationTransform.onlineapply()
        res.status(200).json(distinationtransform)



    } catch (error) { res.status(400).json(notifyMessage(false, 'distinationtransform was not fetch', '', error)) }
})

router.get('/trans', async (req, res) => {
    const getPaylod = verifyToken(req);

    const payload = getPaylod.msg
    try {

        let distinationtransform = await DistinationTransform.transform()
        res.status(200).json(distinationtransform)


    } catch (error) { res.status(400).json(notifyMessage(false, 'distinationtransform transform was not fetch', '', error)) }
})
router.get('/recipt_id/:recipt_id', async (req, res) => {

    try {
        let distinationtransform = await DistinationTransform.byrecp_depart(req.params.recipt_id)
        res.status(200).json(distinationtransform)

    } catch (error) { res.status(400).json(notifyMessage(false, 'distinationtransform was not fetch', '', error)) }
})
router.get('/gettransform/:id', async (req, res) => {
    try {
        let distinationtransform = await DistinationTransform.gettransform(req.params.id)
        res.status(200).json(distinationtransform)

    } catch (error) { res.status(400).json(notifyMessage(false, 'receptionRecord was not fetch', '', error)) }
})
router.post('/', (async (req, res) => {
    try {
        payload = req.body.destTransformArray;
        console.log('payload', payload);
        const reception_id=req.body.reception_id
        let distinationtransform
        const length = req.body.destTransformArray.length
        // للتاكد من ادخال جميع البيانات
        for (let i = 0; i < length; i++) {
            if (!payload[i].distination_transform) {
                console.log('ansssas', payload[i].distination_transform);
              return  res.status(200).json(notifyMessage(false, '', '', `  ادخل الدائرة في الحقل رقم ${i+1}`))
            }

        }
        // ادخال البيانات
        for (let i = 0; i < length; i++) {
            distinationtransform = await DistinationTransform.insert(payload[i], reception_id)

        }
        res.status(200).json(distinationtransform)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'distinationtransform was not post', '', error))
    }
}))

router.put('/', (async (req, res) => {
    try {
        let distinationtransform = await DistinationTransform.update(req.body)
        res.status(200).json(distinationtransform)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'distinationtransform was not put ', '', error))
    }
}))

router.delete('/id/:id', (async (req, res) => {
    console.log('req.body', req.params.id);
    try {
        let distinationtransform = await DistinationTransform.delete(req.params.id)
        res.status(200).json(distinationtransform)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'distinationtransform was not put ', '', error))
    }
}))
module.exports = router