using System.ComponentModel.DataAnnotations;

namespace PISH.Models.UsersViewModels
{
    public class EditViewModel
    {

        [Display(Name = "Name")]
        public string Name { get; set; }

        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
