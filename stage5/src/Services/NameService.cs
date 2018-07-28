namespace opensourceci
{
    public class NameService : INameService
    {
        public string GetName(string title)
        {
            if (string.IsNullOrWhiteSpace(title))
            {
                return "Cedric";
            }

            return $"{title} Cedric";
        }
    }
}