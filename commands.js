var express = require('express');
var router = express.Router();
const { authenticate ,verifyPayload} = require('../middewares/authentication');
const { verifyToken } = require('../auth/jwt');
const pool = require('../db')


/* GET commands listing. */
router.get('/commands', authenticate, function (req, res, next) {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  
  // console.log( 'getPaylod.msg', getPaylod.msg);
  
  pool.query(`select * from commands `)
    .then(([commands]) => {
      res.json({ success: true, err: "", msg: "commands fetch success", data: commands })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "commands fetch failed", data: [] })
    })
    .finally(
      
    )
});
router.get('/commands/coding', authenticate, function (req, res, next) {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  pool.query(`select commands.id,commands.value ,governs.value as Governorate from commands  inner JOIN governs on commands.governID = governs.id `)
    .then(([commands]) => {
      res.json({ success: true, err: "", msg: "commands fetch success", data: commands })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "commands fetch failed", data: [] })
    })
    .finally(
      
    )
});

router.get('/commands/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  pool.query('select * from commands  where id = ? ', [req.params.id])
    .then(([command]) => {
      res.json({ success: true, err: "", msg: "command fetch success", data: command })
    })
    .catch((error) => {
      res.status(400).json({ success: false, err: error, msg: "command fetch failed", data: [] })
    })
    .finally(
      
    )

})

router.post('/commands', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  // console.log('reqm7md',req.body);
    pool.query('insert into commands(value,governID) values (?,?) ', [req.body.value,req.body.governID])
      .then(([command]) => {
        res.json({ success: true, err: "", msg: "command fetch success", data: command })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "command fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })

  
router.put('/commands/:id', authenticate, (req, res, next) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
    pool.query('update commands set value = ? where id = ? ', [req.body.value ,req.params.id])
      .then(([command]) => {
        res.json({ success: true, err: "", msg: "command fetch success", data: command })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "command fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })
  

  router.delete('/commands/:id', authenticate, (req, res, next) => {
    const getPaylod = verifyToken(req)
    if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
    pool.query('delete from commands where id = ? ', [req.params.id])
      .then(([command]) => {
        res.json({ success: true, err: "", msg: "command fetch success", data: command })
      })
      .catch((error) => {
        res.status(400).json({ success: false, err: error, msg: "command fetch failed", data: [] })
      })
      .finally(
        
      )
  
  })
  


module.exports = router;
