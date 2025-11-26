const { notifyMessage } = require("../utils/notification");
const { pool, client } = require("../db/index");
const moment = require("moment-timezone");
const { check } = require("express-validator");

const User = {};

User.all = () => {
  return new Promise((resolve, reject) => {
    let sql = `SELECT users.*,unit_name

    from users 
    inner join public.workunits on public.workunits.unit_id=public.users.unit_id
`;
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Get Successfly", null, error)
        );
      let users = [];
      if (result.rows[0]) {
        result.rows.forEach((user) => {
          delete user.password;
          if (user.created_at) {
            user = {
              ...user,
              created_at: moment(user.create_at)
                .tz("Asia/Baghdad")
                .format("Y-M-D H:m:s"),
            };
          }
          users.push(user);
        });
      }
      return resolve(notifyMessage(true, "Users  Get Successfly", users, null));
    });
  });
};
User.byid = (id) => {
  return new Promise((resolve, reject) => {
    let sql = `SELECT users.*,unit_name

    from users 
    inner join public.workunits on public.workunits.unit_id=public.users.unit_id
 users.id=${id};`;
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Get Successfly", null, error)
        );
      let users = [];
      if (result.rows[0]) {
        result.rows.forEach((user) => {
          delete user.password;
          if (user.created_at) {
            user = {
              ...user,
              created_at: moment(user.create_at)
                .tz("Asia/Baghdad")
                .format("Y-M-D H:m:s"),
            };
          }
          users.push(user);
        });
      }
      return resolve(notifyMessage(true, "Users  Get Successfly", users, null));
    });
  });
};

User.byUserType = (body) => {
  return new Promise((resolve, reject) => {
    let sql = `SELECT users.*,unit_name

    from users 
    inner join public.workunits on public.workunits.unit_id=public.users.unit_id
 WHERE users.id=${body.unit_id};`

    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Get Successfly", null, error)
        );
      let users = [];
      if (result.rows[0]) {
        result.rows.forEach((user) => {
          delete user.password;
          if (user.created_at) {
            user = {
              ...user,
              created_at: moment(user.create_at)
                .tz("Asia/Baghdad")
                .format("Y-M-D H:m:s"),
            };
          }
          users.push(user);
        });
      }
      return resolve(notifyMessage(true, "Users  Get Successfly", users, null));
    });
  });
};

User.login = (username) => {
  return new Promise((resolve, reject) => {
    let sql = `SELECT users.*,unit_name,unit_parent_unit_id

    from users 
    left join public.workunits on public.workunits.unit_id=public.users.unit_id

        WHERE users.username ='${username}'`;
    console.log("sql", sql);
    pool.query(sql, (err, result) => {
      if (err)
        return reject({
          succss: false,
          Msg: "users was not read",
          Data: "",
          err: err,
        });
      if (result.rows.length != 1)
        return resolve(
          notifyMessage(
            false,
            "login error",
            {},
            "invalid username or password"
          )
        );
      let users = [];
      if (result.rows[0]) {
        result.rows.forEach((user) => {
          if (user.created_at) {
            user = {
              ...user,
              created_at: moment(user.create_at)
                .tz("Asia/Baghdad")
                .format("Y-M-D H:m:s"),
            };
          }
          users.push(user);
        });
      }

      resolve(notifyMessage(true, "user was login successfuly", users, ""));
    });
  });
};

User.update = (body, id) => {
  return new Promise((resolve, reject) => {
    let sql = `Update users set
        approval_det_id= ${body.approval_det_id ? body.approval_det_id : "default"} ,
        name= '${body.name}',
        username= '${body.username}',
        user_type = ${body.user_type},
        roles= '${body.roles}',
        activation= ${body.activation},
        sudid = ${body.sudid ? body.sudid : "default"}
        WHERE users.id=${id};`;
    console.log("sql", sql);
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Update Successfly", null, error)
        );
      return resolve(
        notifyMessage(true, "Users  Update Successfly", result.rows, null)
      );
    });
  });
};

// update password by id
User.updatePwd = (userBody, id) => {
  return new Promise((resolve, reject) => {
    // let sql = `Update users set password= '${userBody.password}', first_enter = cast ((true) as bit) WHERE users.id=${userBody.id};`
    let sql = `Update users set password= '${userBody.password}', first_enter = false WHERE users.id=${userBody.id};`;
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Update Successfly", null, error)
        );
      return resolve(
        notifyMessage(true, "Users Update Successfly", result.rows, null)
      );
    });
  });
};

User.insert = (body) => {
  return new Promise((resolve, reject) => {
    console.log('body', body);
    // let roles = JSON.stringify(body.roles)
    let sql = `INSERT INTO users ( name, username, password, roles, activation, created_at, first_enter,unit_id) VALUES (
       
        '${body.name}',
        '${body.username}',
        '${body.password}',
        '${body.roles}',
        ${body.activation},
        default,
        ${body.first_enter},
        ${body.unit_id});`


    console.log("sql", sql);
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users Not Insert Successfly", null, error)
        );
      return resolve(
        notifyMessage(true, "Users  Insert Successfly", result.rows, null)
      );
    });
  });
};

User.delete = (id) => {
  return new Promise((resolve, reject) => {
    let sql = `delete from users WHERE users.id=${id};`;
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "Users doesn't deleted Successfly", null, error)
        );
      return resolve(
        notifyMessage(true, "Users deleted Successfly", result.rows, null)
      );
    });
  });
};
User.SelectForDelete = (body) => {
  return new Promise((resolve, reject) => {
    let sql =
      body.user_type === 2
        ? `SELECT count(*) AS num FROM users
    WHERE (users.roles ->> 'admin'::text) = 'true'::text and user_type=${body.user_type} and approval_det_id=${body.approval_det_id};`
        : `SELECT count(*) AS num FROM users
    WHERE (users.roles ->> 'admin'::text) = 'true'::text and user_type=${body.user_type};`;
    console.log("sql", sql);
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "select Not Get Successfly", "", error)
        );
      return resolve(
        notifyMessage(true, "Admin number of users", result.rows, "")
      );
    });
  });
};
User.SelectForUpdate = (body) => {
  return new Promise((resolve, reject) => {
    let sql =
      body.user_type === 2
        ? `SELECT count(*) AS num FROM users
    WHERE (users.roles ->> 'admin'::text) = 'true'::text and activation = true and user_type=${body.user_type} and approval_det_id=${body.approval_det_id};`
        : `SELECT count(*) AS num FROM users
    WHERE (users.roles ->> 'admin'::text) = 'true'::text and activation = true and user_type=${body.user_type};`;
    console.log("sql", sql);
    pool.query(sql, (error, result) => {
      if (error)
        return reject(
          notifyMessage(false, "select Not Get Successfly", "", error)
        );
      return resolve(
        notifyMessage(true, "Admin number of users", result.rows, "")
      );
    });
  });
};

User.SelectAddMinistApproval = (body) => {
  return new Promise((resolve, reject) => {
    let sql;
    console.log("body", body)
    if (body.user_type === 1 && body.validity === 4) {
      sql = `SELECT count(*)> 0 as Check  FROM public.users
      inner JOIN subidentity ON users.sudid = subidentity.sudid
      where validity=4;`
    }

    if (body.user_type === 2) {
      sql = `select count (*) > 0 as Check FROM public.users 
     WHERE user_type =2 and approval_det_id=${body.approval_det_id} ;`
    }

    if (body.user_type === 3) {
      sql = `select count (*) > 0 as Check FROM public.users 
      WHERE user_type =3;`
    }

    if (!sql) {
      sql = `select count (*) < 0 as Check FROM public.users`
    }
    console.log("sql", sql);
    pool.query(sql, (error, result) => {
      if (error)
        return reject(notifyMessage(false, "select Not Get Successfly", "", error));
      return resolve(notifyMessage(true, "The number of users of type admin in the minister's office is not equal to zero", result.rows, "")
      );
    });
  });
};

module.exports = User;
