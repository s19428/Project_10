using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Project10.Models;

namespace Project10.Services
{
    public interface IDbService
    {
        public IEnumerable<Student> GetStudents();
        public Student GetStudent(string name);
        public List<int> GetSemesterEntries(int studentId);

        public Student GetStudentByIndex(string index);

        public void SaveLogData(string data);

        public Student GetStudentBy_IndexNumber(string IndexNumber);

        public void ClearLog();
    }
}
