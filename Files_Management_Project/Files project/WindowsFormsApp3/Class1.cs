using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;


namespace WindowsFormsApp3
{
    public class Course
    {
        public string ID;
        public string Name;
        public double Hours;
        public double Grade;
        public Course(string id, string name, double hours, double grade)
        {
            this.ID = id;
            this.Name = name;
            this.Hours = hours;
            this.Grade = grade;
        }
    }
    public class Teacher
    {
        public string ID;
        public string Name;
        public double Salary;
        public string CourseID;
        public Teacher(string id, string name, double salary, string courseid)
        {
            this.ID = id;
            this.Name = name;
            this.Salary = salary;
            this.CourseID = courseid;
        }
    }
    public class Student
    {
        public string ID;
        public string Name;
        public double GPA;
        public string CoursesID;
        public Student(string id, string name, double gpa, string coursesid)
        {
            this.ID = id;
            this.Name = name;
            this.GPA = gpa;
            this.CoursesID = coursesid;
        }
    }
    class methods
    {

        static public Teacher[] Get_Teacher()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("Teacher.xml");

            string id = "";
            string name = "";
            string salary = "";
            string courseid = "";
            XmlNodeList list = doc.GetElementsByTagName("Teacher");
            Teacher[] t1 = new Teacher[list.Count];
            for (int i = 0; i < list.Count; i++)
            {
                XmlNodeList children = list[i].ChildNodes;
                id = children[0].InnerText;
                name = children[1].InnerText;
                salary = children[2].InnerText;
                courseid = children[3].InnerText;
                t1[i] = new Teacher(id, name, double.Parse(salary), courseid);
            }

            return t1;
        }
        static public Student[] Get_Student()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("Student.xml");
            string id = "";
            string name = "";
            string GPA = "";
            string coursesid = "";
            XmlNodeList list = doc.GetElementsByTagName("Student");
            Student[] s1 = new Student[list.Count];
            for (int i = 0; i < list.Count; i++)
            {
                XmlNodeList children = list[i].ChildNodes;
                id = children[0].InnerText;
                name = children[1].InnerText;
                GPA = children[2].InnerText;
                coursesid = children[3].InnerText;
                s1[i] = new Student(id, name, double.Parse(GPA), coursesid);
            }

            return s1;
        }
        static public Course[] Get_Course()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("Course.xml");
            string id = "";
            string name = "";
            string hours = "";
            string grade = "";
            XmlNodeList list = doc.GetElementsByTagName("Course");
            Course[] c1 = new Course[list.Count];
            for (int i = 0; i < list.Count; i++)
            {
                XmlNodeList children = list[i].ChildNodes;
                id = children[0].InnerText;
                name = children[1].InnerText;
                hours = children[2].InnerText;
                grade = children[3].InnerText;
                c1[i] = new Course(id, name, double.Parse(hours), double.Parse(grade));
            }

            return c1;
        }
    }
}
