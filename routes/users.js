const router = require("express").Router();
const User = require("../models/User");
const moment = require("moment-timezone");
const bcrypt = require("bcryptjs");
const { addUser, changePwd, resetPwd } = require("../utils/validations");
const { notifyMessage } = require("../utils/notification");
const { verifyToken } = require("../auth/jwt");

// const crypto = require('crypto')

router.get("/", async (req, res) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  try {
    let user = await User.all();
    res.status(200).json(user);
  } catch (error) {
    res.status(400).json(error);
    console.log("error", error);
  }
});

router.get("/id/:id", async (req, res) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  try {
    let user = await User.byid(req.params.id);
    res.status(200).json(user);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.get("/usertype", async (req, res) => {
  try {
    //check token
    const getPaylod = verifyToken(req);
    if (getPaylod.verify == false)
      return res
        .status(400)
        .json(notifyMessage(false, "Authentication error", "", getPaylod.msg));
    let user = await User.byUserType(getPaylod.msg);
    res.status(200).json(user);
  } catch (error) {
    console.log("err", error);
    res.status(400).json(error);
  }
});

router.put("/id/:id", async (req, res) => {
  console.log("body", req.body);
  const getPaylod = verifyToken(req);

  try {
    let userBody = req.body;
    userBody = {
      ...userBody,
      roles: JSON.stringify(userBody.roles),
    };

    if (req.body.activation === false && req.body.roles.admin === true) {
      console.log("tokeeen", getPaylod.msg)
      let lastAdmin = await User.SelectForUpdate(getPaylod.msg);
      console.log("Last", lastAdmin.data)
      if (lastAdmin.data[0].num === "1") {
        return res.status(400).json(
          notifyMessage(false, "Select was not get", "", {
            errUpdate: true,
            errMsg: "لا يمكن الغاء التنشيط كون هذا المستخدم هو اخر مدير",
          })
        );
      }
    }

    let user = await User.update(userBody, req.params.id);
    res.status(200).json(user);
  } catch (error) {
    console.log("error", error);
    res.status(400).json(error);
  }
});

router.put("/reset-password", async (req, res) => {
  //check token
  const getPaylod = verifyToken(req);
  if (getPaylod.verify == false)
    return res
      .status(400)
      .json(notifyMessage(false, "Authentication error", "", getPaylod.msg));
  //check validation
  const { error } = resetPwd(req.body);
  if (error)
    return res
      .status(400)
      .json(
        notifyMessage(false, "Validation error", "", error.details[0].message)
      );
  //update procedure
  try {
    let userBody = req.body;
    let user = await User.login(getPaylod.msg.usr_username);
    if (user.success) {
      if (user.data) {
        //compare password
        if (!bcrypt.compareSync(userBody.password, user.data[0].password))
          return res
            .status(400)
            .json(
              notifyMessage(false, "password error", {}, "invalid password")
            );
        delete user.data[0].password;
      }
    }
    userBody = {
      ...userBody,
      id: getPaylod.msg.id,
      password: bcrypt.hashSync(userBody.password, 10),
    };
    let userUpdate = await User.updatePwd(userBody);
    res.status(200).json(userUpdate);
  } catch (error) {
    console.log("error", error);
    res.status(400).json(error);
  }
});

router.put("/change-password", async (req, res) => {
  //check token
  const getPaylod = verifyToken(req);
  if (getPaylod.verify == false)
    return res
      .status(400)
      .json(notifyMessage(false, "Authentication error", "", getPaylod.msg));
  //check validation
  const { error } = changePwd(req.body);
  if (error)
    return res
      .status(400)
      .json(
        notifyMessage(false, "Validation error", "", error.details[0].message)
      );
  //update procedure
  try {
    let userBody = req.body;
    let user = await User.login(getPaylod.msg.username);
    if (user.success) {
      if (user.data) {
        //compare password
        if (!bcrypt.compareSync(userBody.password, user.data[0].password))
          return res
            .status(400)
            .json(
              notifyMessage(false, "password error", {}, {errPwd:true,errMsg:"كلمة المرور غير صحيحة!"})
            );
        delete user.data[0].password;
      }
    } else {
      return res.status(400).json(notifyMessage(false, "password error", {}, "invalid password"));
    }
    userBody = {
      ...userBody,
      id: getPaylod.msg.id,
      password: bcrypt.hashSync(userBody.newPassowrd, 10),
    };
    let userUpdate = await User.updatePwd(userBody);
    res.status(200).json(userUpdate);
  } catch (error) {
    console.log("error", error);
    res.status(400).json(error);
  }
});
// router.post("/", async (req, res) => {
//   try {
//     const passwordDefault = "12345678";
//     let userBody = req.body;
//     userBody = {
//       ...userBody,
//       password: bcrypt.hashSync(passwordDefault, 10),
//       first_enter: true,
//       roles: JSON.stringify(userBody.roles),
//       created_at: moment().tz("Asia/Baghdad").format("Y-M-D H:m:s"),
//     };
//     let user = await User.insert(userBody);
//     res.status(200).json(user);
//   } catch (error) {
//     console.log("insertError", error);
//     res.status(400).json(error);
//   }
// });

// router.delete("/id/:id", async (req, res) => {
//   try {
//     let usser = await User.delete(req.params.id);
//     res.status(200).json(usser);
//   } catch (error) {
//     res.status(400).json(error);
//   }
// });

router.delete("/id/:id", async (req, res) => {
  try {
    const getPaylod = verifyToken(req);
    let lastAdmin = await User.SelectForDelete(getPaylod.msg);
    console.log(lastAdmin.data[0].num);

    if (lastAdmin.data[0].num === "1") {
      return res.status(400).json(
        notifyMessage(false, "Select was not get", "", {
          errdelet: true,
          errMsg: "لا يمكن الحذف كون هذا المستخدم هو اخر مدير",
        })
      );
    }
    let usser = await User.delete(req.params.id);
    //  res.status(200).json(notifyMessage(true, "Users deleted Successfly", '', null));
    res.status(200).json(usser);
  } catch (error) {
    console.log("error", error);
    res.status(400).json(error);
  }
});

router.post("/", async (req, res) => {
  try {
    const getPaylod = verifyToken(req);
    let admin = await User.SelectAddMinistApproval(req.body);
    console.log("getPaylod", getPaylod.msg);
    console.log("body", req.body);

    if (getPaylod.msg.user_type === 1 && req.body.user_type !== 1) {
      console.log("admin", admin.data);
      if (admin.data[0].check === true) {
        return res.status(400).json(
          notifyMessage(false, "Select was not get", "", {
            errdelet: true,
            errMsg: "لا يمكن الاضافة لوجود مستخدم اخر",
          })
        );
      }
    }

    if (getPaylod.msg.user_type === 1 && getPaylod.msg.validity !== 4 && req.body.validity === 4) {
      console.log("admin", admin.data);
      if (admin.data[0].check === true) {
        return res.status(400).json(
          notifyMessage(false, "Select was not get", "", {
            errdelet: true,
            errMsg: "لا يمكن الاضافة لوجود مستخدم اخر",
          })
        );
      }
    }
    const passwordDefault = "12345678";
    let userBody = req.body;
    userBody = {
      ...userBody,
      password: bcrypt.hashSync(passwordDefault, 10),
      first_enter: true,
      roles: JSON.stringify(userBody.roles),
      created_at: moment().tz("Asia/Baghdad").format("Y-M-D H:m:s"),
    };
    let user = await User.insert(userBody);
    res.status(200).json(user);
  } catch (error) {
    console.log("insertError", error);
    res.status(400).json(error);
  }
});

router.get("/SelectForDelete/id/:id", async (req, res) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  try {
    let user = await User.SelectForDelete(req.params.id);
    res.status(200).json(user);
  } catch (error) {
    console.log("error", error);
    res.status(400).json(notifyMessage(false, "Select was not get", "", error));
  }
});

router.get("/SelectAddMinist", async (req, res) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  try {
    let user = await User.SelectAddMinist();
    res.status(200).json(user);
  } catch (error) {
    res.status(400).json(notifyMessage(false, "Select was not get", "", error));
  }
});

router.get("/SelectAddApprovalDes", async (req, res) => {
  const getPaylod = verifyToken(req)
  if (getPaylod.verify == false) return res.status(400).json(notifyMessage(false, 'Authentication error', '', getPaylod.msg));
  try {
    let user = await User.SelectAddApprovalDes();
    res.status(200).json(user);
  } catch (error) {
    res.status(400).json(notifyMessage(false, "Select was not get", "", error));
  }
});

module.exports = router;
