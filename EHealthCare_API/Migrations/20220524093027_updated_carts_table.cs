using Microsoft.EntityFrameworkCore.Migrations;

namespace EHealthCare_API.Migrations
{
    public partial class updated_carts_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CartProuctId",
                table: "Carts",
                newName: "CartProductId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CartProductId",
                table: "Carts",
                newName: "CartProuctId");
        }
    }
}
