using Assessment.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Assessment.Pages
{
    public class StdDetailsModel : PageModel
    {
        static List<Students> student = new List<Students>()
         {
            new Students(){ StudentId=1,StudentName="Srivastav",Qualification="Btech",Skill="Data Analysis"},
             new Students(){ StudentId=2,StudentName="Pavan",Qualification="Btech",Skill="Java Full-stack"}
         };
        [BindProperty]
        public Students Student { get; set; }
        public List<Students> Students { get { return student; } }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            student.Add(Student);
            return (RedirectToPage("StudentDetails"));
        }
    }
}
