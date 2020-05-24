using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication1.DTOs.Requests;
using Project10.Services;
using Project10.Models;

namespace Lecture10.Controllers
{
    [ApiController]
    [Route("api/students")]
    public class StudentsController : ControllerBase
    {
        /*
        [HttpGet]
        public string GetStudent()
        {
            return "Student1, Student2, Student3";
        }
        */

        /*
        [HttpGet("{id}")]
        public IActionResult GetStudent(int id)
        {
            if (id == 1)
            {
                return Ok("Student1");
            }
            else if (id == 2)
            {
                return Ok("Student2");
            }

            return NotFound("Student not found");
        }
        */

        //private readonly IDbService _dbService;

        //public StudentsController(IDbService dbService)
        //{
        //    _dbService = dbService;
        //}

        public StudentsController()
        { 
            
        }

        [HttpGet]
        public IActionResult GetStudents()
        {
            MasterContext mc = new MasterContext();
            return Ok(mc.Student
                        .OrderBy(s => s.FirstName)
                        .ToList());
        }

        //[HttpGet("{name}")]
        //public IActionResult GetStudent(string name)
        //{
        //    //return $"Student1, Student2, Student3 orderBy = {orderBy}";
        //    //return Ok(_dbService.GetStudent(name));
        //    return null;
        //}

        //[Route("semesterEntries")]
        //[HttpGet("semesterEntries/{IndexNumber}")]
        //public IActionResult GetSemesterEntries(int IndexNumber)
        //{
        //    //return Ok("" + IndexNumber);
        //    //return Ok(_dbService.GetSemesterEntries(IndexNumber));
        //    return null;
        //}

        [HttpPost]
        public IActionResult CreteStudent(Student student)
        {
            MasterContext mc = new MasterContext();
            var exists = mc.Student.Find(student.IndexNumber);

            if (exists == null)
            {
                mc.Student.Add(student);
                return Ok(student);
            }
            else
                return BadRequest("student already exists");
        }

        [Route("modify")]
        [HttpPost]
        public IActionResult ModifyStudent(Student student)
        {
            MasterContext mc = new MasterContext();
            var exists = mc.Student.Find(student.IndexNumber);

            if (exists == null)
            {
                mc.Student.Update(student);
                return Ok("student updated");
            }
            else
                return NotFound("student not found");
        }

        [HttpDelete]
        public IActionResult DeleteStudent(int id)
        {
            MasterContext mc = new MasterContext();
            var exists = mc.Student.Find(id);

            if (exists == null)
            {
                Student student = exists;
                mc.Student.Remove(student);
                return Ok($"student with Id = {id} deleted");
            }
            else
                return NotFound("student not found");
        }



        [HttpPost("promote")]
        public IActionResult PromoteStudents(PromoteStudentRequest request)
        {
            return null;
        }
    }
}