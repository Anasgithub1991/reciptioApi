var express = require('express');
var router = express.Router();
const { authenticate ,verifyPayload} = require('../middewares/authentication');
const { verifyToken } = require('../auth/jwt');
const pool = require('../db')


/* GET department listing. */
router.get('/department', authenticate, function (req, res, next) {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
 
  pool.query('select * from  department')
    .then(([department]) => {
      res.json({ success: true, err: "", msg: "department fetch success", data: department })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
    })
    .finally(
      
    )
});
router.get('/department/Coding', authenticate, function (req, res, next) {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
 
  pool.query('select department.id,department.value,commands.value as Leaderships from department left JOIN commands on department.commandID = commands.id ')
    .then(([department]) => {
      res.json({ success: true, err: "", msg: "department fetch success", data: department })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
    })
    .finally(
      
    )
});

router.get('/department/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  pool.query('select * from department where id = ? ', [req.params.id])
    .then(([department]) => {
      res.json({ success: true, err: "", msg: "department fetch success", data: department })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
    })
    .finally(
      
    )

})
router.get('/department/codings/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  pool.query('select id,value from department where commandID = ? ', [req.params.id])
    .then(([department]) => {
      res.json({ success: true, err: "", msg: "department fetch success", data: department })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
    })
    .finally(
      
    )

})

router.get('/department/command/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  pool.query('select * from department where commandID = ? ', [req.params.id])
    .then(([department]) => {
      res.json({ success: true, err: "", msg: "department fetch success", data: department })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
    })
    .finally(
      
    )

})

router.post('/department', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
    pool.query('insert into department(value,commandID) values (?,?) ', [req.body.value,req.body.commandID])
      .then(([department]) => {
        res.json({ success: true, err: "", msg: "department fetch success", data: department })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })

  
router.put('/department/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
    pool.query('update department set value = ? where id = ? ', [req.body.value ,req.params.id])
      .then(([department]) => {
        res.json({ success: true, err: "", msg: "department fetch success", data: department })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })
  

  router.delete('/department/:id', authenticate, (req, res, next) => {
    const getPaylod = verifyToken(req)
    if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
    pool.query('delete from department where id = ? ', [req.params.id])
      .then(([department]) => {
        res.json({ success: true, err: "", msg: "department fetch success", data: department })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "department fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })
  


module.exports = router;
