import {CoursesService} from "../services/CoursesService.js";

export const CoursesController = {
  async get() {
    return await CoursesService.get();
  },

  async create(data) {
      return await CoursesService.create(data)
  },

  async update(id, data) {
      return await CoursesService.update(id, data);
  },

  async delete(id) {
      return await CoursesService.delete(id);
  }
}
