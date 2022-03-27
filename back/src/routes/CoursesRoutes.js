import {CoursesController} from "../controllers/CoursesController.js";

const sendOk = (res, options) =>
  res.json({
    error: false,
    status: 'OK',
    ...options,
});

const sendData = (res, data) => sendOk(res, { data });

export const CourseRoutes = (router) => {
  router.get('/courses', async (req, res) => {
    return sendData(res, await CoursesController.get());
  });

  router.get('/courses/:id', async (req, res) => {
    const { params } = req;
    return sendData(res, await CoursesController.get(params.id));
  });

  router.post('/courses', async (req, res) => {
    const { body } = req;

    await CoursesController.create(body);

    return sendData(res, 'created');
  });

  router.put('/courses/:id', async (req, res) => {
    const { params, body } = req;

    await CoursesController.update(params.id, body);

    return sendData(res, 'updated');
  });

  router.delete('/courses/:id', async (req, res) => {
    const { params } = req;

    await CoursesController.delete(params.id);

    return sendData(res, 'deleted');
  });
}


