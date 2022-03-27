import {Courses} from "../models/Courses.js";

export const CoursesService = {
  async get() {
    try {
      return await Courses.get();
    } catch (e) {
      throw Error(`Error: ${e}`)
    }
  },

  async create(data) {
    try {
      return await Courses.create(data);
    } catch (e) {
      throw Error(`Error: ${e}`)
    }
  },

  async update(id, data) {
    try {
      return await Courses.update(id, data);
    } catch (e) {
      throw Error(`Error: ${e}`)
    }
  },

  async delete(id) {
    try {
      return await Courses.delete(id);
    } catch (e) {
      throw Error(`Error: ${e}`)
    }
  }
}
