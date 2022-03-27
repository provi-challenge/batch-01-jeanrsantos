import { getDb } from '../db.js';

const db = getDb();

export const Courses = {
  async get(id) {
    if (id) {
      const [[data]] = await db.query(`SELECT * FROM courses WHERE id = ${id}`);
      return data;
    }

    const [data] = await db.query('SELECT * FROM courses');
    return data;
  },

  async create(data) {
    await db.query(`INSERT INTO courses (name, price) VALUES ('${data.name}', ${data.price})`);
  },

  async update(id, data) {
    await db.query(`UPDATE courses SET (name, price) = ('${data.name}', ${data.price}) WHERE id = ${id}`);
  },

  async delete(id) {
    await db.query(`DELETE FROM courses WHERE id = ${id}`);
  }
};
