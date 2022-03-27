import Router from "express-promise-router";
import {CourseRoutes} from "./routes/CoursesRoutes.js";

const router = Router();

export const setupRoutes = app => {
  app.use(router);

  router.get('/', async (req, res) => {
    return res.json({ error: false, status: 'OK' });
  });

  CourseRoutes(router)
};
