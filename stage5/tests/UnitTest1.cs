using System;
using Xunit;

namespace opensourceci
{
    public class UnitTest1
    {
        [Theory]
        [InlineData("Cedric", null)]
        [InlineData("Cedric", "")]
        [InlineData("Mr. Cedric", "Mr.")]
        public void TestGetName(string expected, string title)
        {
            var nameService = new NameService();

            var result = nameService.GetName(title);

            Assert.Equal(expected, result);
        }
    }
}
